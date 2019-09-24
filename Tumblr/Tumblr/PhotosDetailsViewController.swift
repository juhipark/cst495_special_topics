//
//  PhotosDetailsViewController.swift
//  Tumblr
//
//  Created by Juhi on 9/23/19.
//  Copyright © 2019 Juhi. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsView: UIImageView!
    
    var post: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        if let photos = post["photos"] as? [[String: Any]] {
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
            
            detailsView.af_setImage(withURL: url!)
        }
        
    }
    
    @IBAction func fullScreenGesture(_ sender: Any) {
        performSegue(withIdentifier: "fullScreenSegue", sender: nil)
        
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find the selected Photo
        if let photos = post["photos"] as? [[String: Any]] {
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
         
            // Pass the selected photo to the details veiw controller
            let fullScreenViewController = segue.destination as! FullScreenPhotoViewController
            fullScreenViewController.imageUrl = url
        }
        
    }

}
