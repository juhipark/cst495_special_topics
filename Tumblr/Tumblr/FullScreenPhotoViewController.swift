//
//  FullScreenPhotoViewController.swift
//  Tumblr
//
//  Created by Juhi on 9/23/19.
//  Copyright © 2019 Juhi. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var fullScreenView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    var imageUrl: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        fullScreenView.af_setImage(withURL: imageUrl!)
        
        // set maximum zoom scale (default is 1, thus more )
        scrollView.maximumZoomScale = 50
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / fullScreenView.bounds.width
        let heightScale = size.height / fullScreenView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return fullScreenView
    }
}
