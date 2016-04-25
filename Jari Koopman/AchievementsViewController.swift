
//
//  AchievementsViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Things I've done"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(AchievementsViewController.openSideMenu))
        view.backgroundColor = UIColor.lightGrayColor()

        //ScrollView setup
        
        let imagesArray: [String] = ["swift-og","Facebook-48","app-about","swift-og"]
        
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, 300)
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
        textLabel.textAlignment = .Center
        textLabel.textColor = UIColor.blackColor()
        self.pageControl.currentPage = 0
        scrollViewDidEndDecelerating(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage)
        // Change rest of view
        
        switch (Int(currentPage)) {
        case 0:
            textLabel.text = "page 1"
        case 1:
            textLabel.text = "page 2"
        case 2:
            textLabel.text = "page 3"
        default:
            textLabel.text = "page 4"
        }
    }
}
