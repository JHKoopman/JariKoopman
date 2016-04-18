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
    
    let factGeneratorClass = factGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funFactLabel.text = factGeneratorClass.anotherFactPressed(funFactLabel.text!)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(AboutMeViewController.openSideMenu))
        hobbiesLabel.adjustsFontSizeToFitWidth = true
        funFactLabel.adjustsFontSizeToFitWidth = true
        
        //ScrollView Setup
        
        //1
        self.scrollView.frame = CGRectMake(0, 0, 343, 150)
        let scrollViewWidth:CGFloat = 343
        let scrollViewHeight:CGFloat = 150
        //2
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "app-about")
        imgOne.contentMode = .ScaleAspectFit
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "app-feedback")
        imgTwo.contentMode = .ScaleAspectFit
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0, scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "Facebook-48")
        imgThree.contentMode = .ScaleAspectFit
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0, scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "Twitter-48")
        imgFour.contentMode = .ScaleAspectFit
        //3
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, self.scrollView.frame.height)
        self.scrollView.delegate = self


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }

    @IBAction func anotherFactPressed() {
        funFactLabel.text = factGeneratorClass.anotherFactPressed(funFactLabel.text!)
    }
    
}
