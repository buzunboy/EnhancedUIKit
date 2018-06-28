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
     * Easier HTTP Requests with highly customizable parameters.
     *
     * 5 main types of requests can be used. **PUT**, **POST**, **GET**, **DELETE** and **PATCH**.
     *
     * Requests returns either result as a Dictionary, or data with the download requests.
     *
     * Using download requests, data can be downloaded from the result of the request.
     *
     * Standard requests are returns result of the request from the backend service.
     *
     * - since: 1.0.0
     */
    public class HTTPEngine {
        
        private init() {
            
        }
        
        // MARK: - Public Methods
        
        /**
         * Executes **POST** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func post(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.post(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **POST** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func post(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            self.executeRequest(withURL, type: .post, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Executes **GET** request with standard URL.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func get(_ withURL: URL, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            self.executeRequest(withURL, type: .get, body: nil, headers: nil, completion: completion)
        }
        
        /**
         * Executes **GET** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func get(_ withURL: String, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.get(urlConverter.0!, headers: nil, completion: completion)
            }
        }
        
        /**
         * Executes **GET** request with standard URL.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func get(_ withURL: String, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.get(urlConverter.0!, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **GET** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func get(_ withURL: URL, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            self.executeRequest(withURL, type: .get, body: nil, headers: headers, completion: completion)
        }
        
        /**
         * Executes **PUT** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func put(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.put(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **PUT** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func put(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            self.executeRequest(withURL, type: .put, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Executes **PATCH** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func patch(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.patch(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **PATCH** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func patch(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            self.executeRequest(withURL, type: .patch, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Executes **DELETE** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func delete(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.delete(urlConverter.0!, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Executes **DELETE** request.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter result: Returns response of the request, otherwise nil.
         */
        public class func delete(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            self.executeRequest(withURL, type: .delete, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Downloads data from the **POST** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithPostRequest(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            self.executeDownloadRequest(withURL, type: .post, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Downloads data from the **POST** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithPostRequest(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.executeDownloadRequest(urlConverter.0!, type: .post, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Downloads data from the **GET** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithGetRequest(_ withURL: URL, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            self.executeDownloadRequest(withURL, type: .get, body: nil, headers: headers, completion: completion)
        }
        
        /**
         * Downloads data from the **GET** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter headers: Dictionary of the header for the request
         * - parameter body: Body of the request as a dictionary
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithGetRequest(_ withURL: String, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.executeDownloadRequest(urlConverter.0!, type: .get, body: nil, headers: headers, completion: completion)
            }
        }
        
        /**
         * Downloads data from the **DELETE** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithDeleteRequest(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            self.executeDownloadRequest(withURL, type: .delete, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Downloads data from the **DELETE** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithDeleteRequest(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.executeDownloadRequest(urlConverter.0!, type: .delete, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Downloads data from the **PUT** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithPutRequest(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            self.executeDownloadRequest(withURL, type: .put, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Downloads data from the **PUT** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithPutRequest(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.executeDownloadRequest(urlConverter.0!, type: .put, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Downloads data from the **PATCH** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithPatchRequest(_ withURL: URL, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            self.executeDownloadRequest(withURL, type: .patch, body: body, headers: headers, completion: completion)
        }
        
        /**
         * Downloads data from the **PATCH** request
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter body: Body of the request as a dictionary
         * - parameter headers: Dictionary of the header for the request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadWithPatchRequest(_ withURL: String, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.executeDownloadRequest(urlConverter.0!, type: .patch, body: body, headers: headers, completion: completion)
            }
        }
        
        /**
         * Downloads data from the URL.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL for request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadFrom(_ withURL: URL, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            self.executeDownload(withURL, completion: completion)
        }
        
        /**
         * Downloads data from the URL.
         * Unless any error occurs, error will return nil
         * - parameter withURL: URL String for request
         * - parameter completion: Calls when response receives or any error occurs.
         * - parameter error: Returns error if any occurs
         * - parameter data: Returns data downloaded from the request, otherwise nil.
         */
        public class func downloadFrom(_ withURL: String, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            let urlConverter = self.controlURLString(withURL)
            if let error = urlConverter.1 {
                completion(error, nil)
            } else {
                self.executeDownload(urlConverter.0!, completion: completion)
            }
        }
        
        // MARK: - Private Methods
        
        private class func executeRequest(_ withURL: URL, type: requestHTTPType, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ result: [String:Any]?)->()) {
            
            DispatchQueue.global().async {
                
                var request = URLRequest(url: withURL)
                request.httpMethod = type.rawValue
                request.allHTTPHeaderFields = headers
                if let body = body {
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    do {
                        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                    } catch {
                        let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.jsonError.rawValue, description: "Couldn't prepare http body - Error: \(error.localizedDescription) - Body: \(body)")
                        completion(err, nil)
                    }
                }
                
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        let nsErr = error as NSError
                        let err = NSError(domain: nsErr.domain, code: nsErr.code, description: "Error occured during task - Error: \(error.localizedDescription)")
                        completion(err, nil)
                        return
                    }
                    if let response = response {
                        let httpResp = response as! HTTPURLResponse
                        
                        if httpResp.statusCode < 300 && httpResp.statusCode >= 200 {
                            if data != nil {
                                guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: 0)),
                                    let jsonDictionary = json as? [String: AnyObject] else {
                                        DispatchQueue.main.async {
                                            let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.jsonError.rawValue, description: "Couldn't prepare json from response")
                                            completion(err, nil)
                                        }
                                        return
                                }
                                DispatchQueue.main.async {
                                    completion(nil, jsonDictionary)
                                }
                            } else {
                                DispatchQueue.main.async {
                                    let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No data found in the response with response code: \(httpResp.statusCode)")
                                    completion(err, nil)
                                }
                            }
                        } else {
                            DispatchQueue.main.async {
                                let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: httpResp.statusCode, description: HTTPURLResponse.localizedString(forStatusCode: httpResp.statusCode))
                                completion(err, nil)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No response is received")
                            completion(err, nil)
                        }
                    }
                    
                }
                task.resume()
            }
            
        }
        
        private class func executeDownloadRequest(_ withURL: URL, type: requestHTTPType, body: [String:Any]?, headers: [String:String]?, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            DispatchQueue.global().async {
                
                var request = URLRequest(url: withURL)
                request.httpMethod = type.rawValue
                request.allHTTPHeaderFields = headers
                if let body = body {
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    do {
                        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                    } catch {
                        let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.jsonError.rawValue, description: "Couldn't prepare http body - Error: \(error.localizedDescription) - Body: \(body)")
                        completion(err, nil)
                    }
                }
                
                let task = URLSession.shared.downloadTask(with: request) { (location, response, error) in
                    if let error = error {
                        DispatchQueue.main.async {
                            let nsErr = error as NSError
                            let err = NSError(domain: nsErr.domain, code: nsErr.code, description: "Error occured during task - Error: \(error.localizedDescription)")
                            completion(err, nil)
                        }
                        return
                    }
                    if let response = response {
                        let httpResp = response as! HTTPURLResponse
                        
                        if httpResp.statusCode < 300 && httpResp.statusCode >= 200 {
                            if let data = try? Data(contentsOf: location!) {
                                DispatchQueue.main.async {
                                    completion(nil, data)
                                }
                            } else {
                                DispatchQueue.main.async {
                                    let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No data found in the response with response code: \(httpResp.statusCode)")
                                    completion(err, nil)
                                }
                            }
                        } else {
                            DispatchQueue.main.async {
                                let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: httpResp.statusCode, description: HTTPURLResponse.localizedString(forStatusCode: httpResp.statusCode))
                                completion(err, nil)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No response is received")
                            completion(err, nil)
                        }
                    }
                }
                task.resume()
                
            }
        }
        
        private class func executeDownload(_ withURL: URL, completion: @escaping (_ error: Error?, _ data: Data?)->()) {
            
            DispatchQueue.global().async {
                
                let task = URLSession.shared.downloadTask(with: withURL) { (location, response, error) in
                    if let error = error {
                        DispatchQueue.main.async {
                            let nsErr = error as NSError
                            let err = NSError(domain: nsErr.domain, code: nsErr.code, description: "Error occured during task - Error: \(error.localizedDescription)")
                            completion(err, nil)
                        }
                        return
                    }
                    if let response = response {
                        let httpResp = response as! HTTPURLResponse
                        
                        if httpResp.statusCode < 300 && httpResp.statusCode >= 200 {
                            if let data = try? Data(contentsOf: location!) {
                                DispatchQueue.main.async {
                                    completion(nil, data)
                                }
                            } else {
                                DispatchQueue.main.async {
                                    let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No data found in the response with response code: \(httpResp.statusCode)")
                                    completion(err, nil)
                                }
                            }
                        } else {
                            DispatchQueue.main.async {
                                let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: httpResp.statusCode, description: HTTPURLResponse.localizedString(forStatusCode: httpResp.statusCode))
                                completion(err, nil)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.taskError.rawValue, description: "No response is received")
                            completion(err, nil)
                        }
                    }
                }
                task.resume()
                
            }
        }
        
        private class func controlURLString(_ string: String) -> (URL?,NSError?) {
            if let url = URL(string: string) {
                return (url, nil)
            } else {
                let err = NSError(domain: extendedErrorDomains.EUIKitDomain.rawValue, code: extendedErrorCodes.urlConvertionError.rawValue, description: "Couldn't prepare url with the given string - String: \(string)")
                return (nil, err)
            }
        }
        
    }
}

