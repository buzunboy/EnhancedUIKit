// This code is distributed under the terms and conditions of the MIT license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

extension EUIKit {
    
    /**
     * Saves or brings images from the device storage.
     * - since: 1.0.0
     */
    public class ImageStore: NSObject {
        
        private var imageStorageName = "images"
        
        /**
         * Initializes Image storage object in the specified folder path.
         * - important: If you need more specified path you can use **folderpath1/folderpath2** as a folderName.
         */
        init(folderName: String) {
            self.imageStorageName = folderName
        }
        
        /**
         * Loads image from the storage.
         *
         * If Image isn't saved before to device directory, saves image to device directory from the imageURL, and returns the newly created image.
         * - parameter imageURL: URL path for the image in case cannot be found in the device directory.
         * - parameter name: Name of the saved image. If image is downloaded from url, it will also saved with that name.
         * - parameter splashImage: If image cannot be found in the device directory and also couldn't be downloaded, handler will return splash image.
         * - parameter quality: Compression quality for the image. It will only effect newly downloaded images.
         * - parameter handler: Will be called when operations are completed or failed.
         * - parameter image: The result of the operation.
         */
        public func getImageFromStorage(imageURL: String, name: String, splashImage: UIImage?, with quality: CGFloat = 1.0, handler: @escaping (_ image: UIImage?)->()){
            if imageURL != "" {
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let filePath = documentsURL.appendingPathComponent("\(self.imageStorageName)/\(name)").path
                if FileManager.default.fileExists(atPath: filePath) {
                    handler(UIImage(contentsOfFile: filePath))
                } else {
                    saveImageToStorage(imageURL: imageURL, name: name, quality: quality, handler: { (loaded) in
                        handler(loaded)
                    })
                }
            } else {
                handler(splashImage)
            }
        }
        
        /**
         * Loads image from the storage.
         *
         * - parameter name: Name of the image.
         * - parameter splashImage: If image cannot be found in the device directory, handler will return splash image.
         * - parameter handler: Will be called when operations are completed or failed.
         * - parameter image: The result of the operation.
         */
        public func getImageFromStorage(name: String, splashImage: UIImage?, handler: @escaping (_ image: UIImage?)->()){
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let filePath = documentsURL.appendingPathComponent("\(self.imageStorageName)/\(name)").path
            if FileManager.default.fileExists(atPath: filePath) {
                handler(UIImage(contentsOfFile: filePath))
            } else {
                handler(splashImage)
            }
        }
        
        /**
         * Downloads image from the url and saves to the directory.
         *
         * - parameter imageURL: URL path for the image.
         * - parameter name: Name for the saved image in the device directory.
         * - parameter quality: Compression quality for the saved image.
         * - parameter handler: Will be called when operations are completed or failed.
         * - parameter image: The result of the operation.
         */
        public func saveImageToStorage(imageURL: String, name: String, quality: CGFloat = 1.0, handler: ((_ image: UIImage?)->())?) {
            ImageCacheLoader.sharedInstance.loadImage(imageURL, to: nil, withSplashImage: nil) { (loaded, image) in
                if let image = image {
                    do {
                        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                        let folderURL = documentsURL.appendingPathComponent(self.imageStorageName)
                        if !FileManager.default.fileExists(atPath: folderURL.absoluteString) {
                            self.createDirectory(name: self.imageStorageName)
                        }
                        let fileURL = folderURL.appendingPathComponent(name)
                        try UIImageJPEGRepresentation(image, quality)?.write(to: fileURL, options: .atomic)
                        handler?(image)
                    } catch {
                        EUIKit.LogInterface.log(withLevel: .Info, "Couldn't save the image - Error: \(error.localizedDescription)")
                        handler?(nil)
                    }
                }
            }
        }
        
        /**
         * Creates directory in documents with the specified name.
         * - parameter name: Name of the directory.
         */
        private func createDirectory(name: String) {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let directoryPath = documentsURL.appendingPathComponent(name)
            do {
                try FileManager.default.createDirectory(atPath: directoryPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch let error as NSError {
                EUIKit.LogInterface.log(withLevel: .Info, "Unable to create directory - Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    private class ImageCacheLoader {
        
        var task: URLSessionDownloadTask!
        var session: URLSession!
        typealias ImageCacheLoaderCompletionHandler = ((UIImage?) -> ())
        var imageCache: NSCache<NSString, UIImage>!
        
        static let sharedInstance = ImageCacheLoader()
        
        init() {
            session = URLSession.shared
            task = URLSessionDownloadTask()
            imageCache = NSCache()
        }
        
        func loadImage(_ image: String?, to: UIImageView?, withSplashImage: UIImage?, handler: @escaping (_ result: Bool, _ loaded: UIImage?) -> Void){
            if image != nil {
                if image != "" {
                    self.obtainImageWithPath(imagePath: image!, splashImage: withSplashImage, completionHandler: { (imageLoaded) in
                        to?.image = imageLoaded
                        to?.clipsToBounds = true
                        to?.contentMode = .scaleAspectFill
                        handler(true, imageLoaded)
                    })
                } else {
                    if withSplashImage == .none {
                        handler(false, nil)
                        return
                    }
                    handler(false, withSplashImage)
                    EUIKit.LogInterface.log(withLevel: .Info, "Image string is empty!, splash image is used for \(to?.description ?? "")")
                    to?.image = withSplashImage
                    to?.clipsToBounds = true
                    to?.contentMode = .scaleAspectFill
                }
            } else {
                if withSplashImage == .none {
                    handler(false, nil)
                    return
                }
                handler(false, withSplashImage)
                EUIKit.LogInterface.log(withLevel: .Info, "Image string is nil!, splash image is used for \(to?.description ?? "")")
                to?.image = withSplashImage
                to?.clipsToBounds = true
                to?.contentMode = .scaleAspectFill
            }
        }
        
        func obtainImageWithPath(imagePath: String, splashImage: UIImage?, completionHandler: @escaping ImageCacheLoaderCompletionHandler) {
            if let image = imageCache.object(forKey: imagePath as NSString) {
                DispatchQueue.main.async {
                    completionHandler(image)
                    EUIKit.LogInterface.log(withLevel: .Info, "Image is loaded from the cache: \(imagePath)")
                }
            } else {
                let url: URL! = URL(string: imagePath)
                HTTPEngine.downloadFrom(url) { (error, data) in
                    if let error = error {
                        EUIKit.LogInterface.log(withLevel: .Info, "Couldn't download the image - image: \(imagePath) - Error: \(error.localizedDescription)")
                        completionHandler(splashImage)
                        return
                    }
                    
                    let img: UIImage! = UIImage(data: data!)
                    self.imageCache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                        EUIKit.LogInterface.log(withLevel: .Info, "Image is uploaded to the cache: %@", imagePath)
                    }
                    
                }
            }
        }
    }
    
}
