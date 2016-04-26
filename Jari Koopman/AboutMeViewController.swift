//
//  AboutMeViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var hobbiesLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let factGeneratorClass = factGenerator()
    let imagesArray: [String] = ["Apple with tea", "Mac with tea", "Mac and me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()

        self.title = "About me"
        funFactLabel.text = factGeneratorClass.anotherFactPressed(funFactLabel.text!)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(AboutMeViewController.openSideMenu))
        hobbiesLabel.adjustsFontSizeToFitWidth = true
        funFactLabel.adjustsFontSizeToFitWidth = true
        pageControl.numberOfPages = imagesArray.count
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        
        //ScrollView Setup
        self.scrollView.frame = CGRectMake(0, 0, 343, self.scrollView.frame.height)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }

    @IBAction func anotherFactPressed() {
        funFactLabel.text = factGeneratorClass.anotherFactPressed(funFactLabel.text!)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        self.pageControl.currentPage = Int(currentPage)
    }
    
}
