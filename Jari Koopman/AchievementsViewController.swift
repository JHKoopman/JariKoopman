
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
        
        //1 
        self.scrollView.frame = (CGRectMake(0, 0, self.view.frame.width, 300))
        let scrollViewWidth = self.scrollView.frame.width
        let scrollViewHeight = self.scrollView.frame.height
        //2
        textLabel.textAlignment = .Center
        textLabel.textColor = UIColor.blackColor()
        //3
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imgOne.contentMode = .ScaleAspectFit
        imgOne.image = UIImage(named: "swift-og")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imgTwo.contentMode = .ScaleAspectFit
        imgTwo.image = UIImage(named: "swift-og")

        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0, scrollViewWidth, scrollViewHeight))
        imgThree.contentMode = .ScaleAspectFit
        imgThree.image = UIImage(named: "swift-og")

        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0, scrollViewWidth, scrollViewHeight))
        imgFour.contentMode = .ScaleAspectFit
        imgFour.image = UIImage(named: "swift-og")

        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width*4, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
