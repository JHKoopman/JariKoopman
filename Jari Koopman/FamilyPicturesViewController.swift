//
//  FamilyPicturesViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 25/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class FamilyPicturesViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let imagesArray: [String] = ["swift-og", "app-about", "app-feedback", "Python", "Swift on mac", "Mac with Gear"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        
        //ScrollView Setup
        
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth = self.scrollView.frame.width
        let scrollViewHeight = self.scrollView.frame.height
        
        var imageIndex: Int = 0
        for _ in imagesArray {
            let imageView = UIImageView(frame: (CGRectMake(scrollViewWidth*CGFloat(imageIndex), 0, scrollViewWidth, scrollViewHeight)))
            imageView.contentMode = .ScaleAspectFit
            imageView.image = UIImage(named: imagesArray[imageIndex])
            self.scrollView.addSubview(imageView)
            imageIndex = imageIndex+1
        }
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width*CGFloat(imagesArray.count), self.scrollView.frame.height)
        self.scrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
