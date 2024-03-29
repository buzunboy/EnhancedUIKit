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

/**
 * EUITableViewController with cover image on top of the view.
 * The one of the most commly table view presentation style on the iOS applications.
 *
 * Load the image which desired as cover photo to **coverImage** and set height with using **coverHeight**.
 *
 * - important: **super.viewDidLoad()** must be called somewhere in the **viewDidLoad()** method. If **scrollViewDidScroll()** will be used,
 * **super.viewDidScroll()** must be also called.
 * - since: 1.0.0
 */
open class CoverTableViewController: EUITableViewController {
    
    /**
     * The height of the cover image, when scroll position pass this value, cover image will disappears completely from the view.
     *
     * Default value is 300
     */
    private var coverHeight: CGFloat = 300
    private var coverImageView: UIImageView!
    
    /**
     * The cover image which will be used to show cover.
     */
    private var coverImage: UIImage!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        self.tableView.separatorStyle = .none
        self.reloadCoverImageView()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.reloadCoverImageView()
    }
    
    private func prepareCoverImageView() {
        coverImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: coverHeight))
        coverImageView.image = coverImage
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
    }
    
    private func reloadCoverImageView(shouldLoadImage: Bool = false) {
        if coverImageView == nil {
            prepareCoverImageView()
        }
        
        if shouldLoadImage {
            coverImageView.image = coverImage
        }
        
        coverImageView.removeFromSuperview()
        coverImageView.frame = CGRect(x: 0, y: self.tableView.contentOffset.y, width: self.view.frame.width, height: coverHeight - self.tableView.contentOffset.y)
        self.view.insertSubview(coverImageView, at: 0)
    }
    
    public func changeCoverImage(with image: UIImage) {
        self.coverImage = image
        self.reloadCoverImageView(shouldLoadImage: true)
    }
    
    public func changeCoverImage(withImageName: String) {
        self.coverImage = UIImage(named: withImageName)
        self.reloadCoverImageView(shouldLoadImage: true)
    }
    
    public func changeCoverImageHeight(to height: CGFloat) {
        self.coverHeight = height
        self.reloadCoverImageView()
    }
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
