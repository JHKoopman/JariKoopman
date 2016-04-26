//
//  ViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

var firstTimeLaunch: Bool = true


class ViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var youThereLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var learnMoreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        hiLabel.hidden = true
        youThereLabel.alpha = 0.0
        welcomeLabel.alpha = 0.0
        learnMoreButton.alpha = 0.0

        self.sideMenuController()?.sideMenu?.delegate = self
        
        
        if firstTimeLaunch == true {
            setupView()
            firstTimeLaunch = false
        } else {
            secondLoadOfView()
        }
    }
    
    func secondLoadOfView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(ViewController.openSideMenu))
        self.title = "Jari Koopman"
        welcomeLabel.text = "Back again? If you're ready exploring you can quit the app, if not click the button at the top left corner or the button below!"
        welcomeLabel.alpha = 1.0
        learnMoreButton.setTitle("Resume exploring!", forState: .Normal)
        learnMoreButton.alpha = 1.0

    }
    
    func setupView() {
        hiLabel.hidden = false
        UIView.animateWithDuration(5.0, animations: { () -> Void in
            self.youThereLabel.alpha = 1.0
        })
        UIView.animateWithDuration(5.0, delay: 5.0, options: .OverrideInheritedOptions, animations: {
            self.welcomeLabel.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(5.0, delay: 11.0, options: .AllowUserInteraction, animations: {
            self.learnMoreButton.alpha = 1.0
            }, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func pressedLearnMoreButton() {
        toggleSideMenuView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(ViewController.openSideMenu))
        self.title = "Jari Koopman"

    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }
    
        
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }



}

