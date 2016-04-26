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
    
    let skillsArray: [String] = [
        "I learned Swift in online courses at Teamtreehouse. I'm currently pretty much up to date with Swift at basic and intermediate level. I am stil working on expanding my knowledge about Swift by taking more courses and I learn more every day at my internship.",
        "Python is the first programming language I ever touched, it was at my first secundary school where we did an ICT project where we learned Python. That started my love for programming and because I already was an Apple addict I started with developing apps.",
        "I only started using Sketch a few weeks ago, I was searching for a design program for my apps that works easy and was not to expensive, I first looked at Adobe but I can't afford such programs at this point in time.",
        "Next to some programming languages I speak (almost) flawles English and flawles Dutch. I learned most of my English on our trips to Australia and Tasmania. I also have an Anglia degree at advanced level whitch is CEFR level B2."
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(SkillsViewController.openSideMenu))
        
        imageView.contentMode = .ScaleAspectFit
        self.title = "Skills"
        
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        //ScrollView Setup
        
        //1
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrolLViewWidth = self.scrollView.frame.width
        let scrollViewHeight = self.scrollView.frame.height
        //2
        skillLevelLabel.textAlignment = .Center
        skillLevelLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.whiteColor()
        descriptionLabel.textAlignment = .Center
        descriptionLabel.textColor = UIColor.whiteColor()
        //3
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrolLViewWidth, scrollViewHeight))
        imgOne.contentMode = .ScaleAspectFit
        imgOne.image = UIImage(named: "Swift on mac")
        let imgTwo = UIImageView(frame: CGRectMake(scrolLViewWidth, 0, scrolLViewWidth, scrollViewHeight))
        imgTwo.contentMode = .ScaleAspectFit
        imgTwo.image = UIImage(named: "Mac with Gear")
        let imgThree = UIImageView(frame: CGRectMake(scrolLViewWidth*2, 0, scrolLViewWidth, scrollViewHeight))
        imgThree.contentMode = .ScaleAspectFit
        imgThree.image = UIImage(named: "Mac with Gear")
        let imgFour = UIImageView(frame: CGRectMake(scrolLViewWidth*3, 0, scrolLViewWidth, scrollViewHeight))
        imgFour.contentMode = .ScaleAspectFit
        imgFour.image = UIImage(named: "Swift on mac")
        
        
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
        // Change rest of view
        
        switch (Int(currentPage)) {
        case 0:
            imageView.image = UIImage(named: "swift-og")
            titleLabel.text = "Swift"
            skillLevelLabel.text = "Skill level: 80%"
            descriptionLabel.text = skillsArray[Int(currentPage)]
        case 1:
            imageView.image = UIImage(named: "Python")
            titleLabel.text = "Python"
            skillLevelLabel.text = "Skill level: 55%"
            descriptionLabel.text = skillsArray[Int(currentPage)]
        case 2:
            imageView.image = UIImage(named: "sketch")
            titleLabel.text = "Sketch"
            skillLevelLabel.text = "Skill level: 10%"
            descriptionLabel.text = skillsArray[Int(currentPage)]
        default:
            imageView.image = UIImage(named: "Flags")
            titleLabel.text = "Languages"
            skillLevelLabel.text = "Skill level: 90%"
            descriptionLabel.text = skillsArray[Int(currentPage)]
        }

    }

}
