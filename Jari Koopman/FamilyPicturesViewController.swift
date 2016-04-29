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
    @IBOutlet weak var pageControl: UIPageControl!
    
    let imagesArray: [String] = ["Face","Micka 1","Micka 2","Brother","Kano","Segway"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        self.title = "Family photos"
        pageControl.numberOfPages = imagesArray.count
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
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
        pageControl.currentPage = 0

    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        self.pageControl.currentPage = Int(currentPage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
