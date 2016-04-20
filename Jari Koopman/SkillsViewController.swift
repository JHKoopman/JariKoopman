//
//  SkillsViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var skillLevelLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(SkillsViewController.openSideMenu))
        
        imageView.contentMode = .ScaleAspectFit
        
        
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        //ScrollView Setup
        
        //1
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrolLViewWidth = self.scrollView.frame.width
        let scrollViewHeight = self.scrollView.frame.height
        //2
        skillLevelLabel.textAlignment = .Center
        titleLabel.textAlignment = .Center
        descriptionLabel.textAlignment = .Center
        //3
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrolLViewWidth, scrollViewHeight))
        imgOne.contentMode = .ScaleToFill
        imgOne.image = UIImage(named: "swift-og")
        let imgTwo = UIImageView(frame: CGRectMake(scrolLViewWidth, 0, scrolLViewWidth, scrollViewHeight))
        imgTwo.contentMode = .ScaleAspectFit
        let imgThree = UIImageView(frame: CGRectMake(scrolLViewWidth*2, 0, scrolLViewWidth, scrollViewHeight))
        imgThree.contentMode = .ScaleAspectFit
        let imgFour = UIImageView(frame: CGRectMake(scrolLViewWidth*3, 0, scrolLViewWidth, scrollViewHeight))
        imgFour.contentMode = .ScaleAspectFit
        
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width*4, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        scrollViewDidEndDecelerating(scrollView)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }
    
    //MARK: ScrollViewDelegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        
        switch (Int(currentPage)) {
        case 0:
            imageView.image = UIImage(named: "swift-og")
            titleLabel.text = "Title 1"
            skillLevelLabel.text = "OVER 9000!!!!!!!!!!!"
            descriptionLabel.text = "Description 1"
        case 1:
            imageView.image = UIImage(named: "Python")
            titleLabel.text = "Titel 2"
            skillLevelLabel.text = "Not over 9000"
            descriptionLabel.text = "Description 2"
        case 2:
            imageView.image = UIImage(named: "menu")
            titleLabel.text = "Title 3"
            skillLevelLabel.text = "Below 9000"
            descriptionLabel.text = "Description 3"
        default:
            imageView.image = UIImage(named: "app-about")
            titleLabel.text = "Title 4"
            skillLevelLabel.text = "some"
            descriptionLabel.text = "Description 4"
        }

    }

}
