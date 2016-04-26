
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
    @IBOutlet weak var downloadButton: UIButton!
    
    let thingsArray: [String] = [
        "Because we have got friends in Tasmania, Australia I've been there 3 times now. I learned a lot of English during our visits. Last time I was 11 years old and we also visited Melbourne and Sidney",
        "Because I'm highly gifted and I've got a great passion for coding me and my parents decided to look for a school where I would have the opportunity to learn coding next to my school work. I'm very happy about my school switch although I've got to travel 3,5 hours a day to go there. I'm travling by bike and by train.",
        "My aunt and uncle hava a camping in Germany, for me a great opportunity and a nice challenge to make my first app with sightseeing tips for their visitors.",
        "For sports I ride a lot on my bike and every week I train Pencak Silat, an Indonesian martial art. At home I like to play with a ball or on our trampoline. Besides this I also really like climbing, especially in a forest climbing park."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Things I've done"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(AchievementsViewController.openSideMenu))
        view.backgroundColor = UIColor.lightGrayColor()

        //ScrollView setup
        downloadButton.hidden = true
        textLabel.adjustsFontSizeToFitWidth = true
        
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
    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }
    @IBAction func pressedDownloadButton() {
        let url:NSURL = NSURL(string: "https://itunes.apple.com/us/app/camping-elbeling/id1071046354?ls=1&mt=8")!
        UIApplication.sharedApplication().openURL(url)
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
            textLabel.text = thingsArray[Int(currentPage)]
            downloadButton.hidden = true

        case 1:
            textLabel.text = thingsArray[Int(currentPage)]
            downloadButton.hidden = true

        case 2:
            textLabel.text = thingsArray[Int(currentPage)]
            downloadButton.hidden = false
        default:
            textLabel.text = thingsArray[Int(currentPage)]
            downloadButton.hidden = true

        }
    }
}
