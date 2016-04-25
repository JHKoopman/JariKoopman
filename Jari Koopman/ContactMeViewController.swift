//
//  ContactMeViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit
import MessageUI

class ContactMeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()

        self.title = "Contact me"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(ContactMeViewController.openSideMenu))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openSideMenu(){
        toggleSideMenuView()
    }
    
    @IBAction func twitterPressed() {
        let url: NSURL = NSURL(string: "https://twitter.com/lordpotvis")!
        UIApplication.sharedApplication().openURL(url)
    }

    @IBAction func facebookPressed() {
        let url: NSURL = NSURL(string: "https://www.facebook.com/hans.koopman.7169?ref=bookmarks")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func phonePressed() {
        let phoneNumber = "tel://0031591362764"
        let url: NSURL = NSURL(string: phoneNumber)!
        UIApplication.sharedApplication().openURL(url)
    }

    @IBAction func mailPressed() {
        sendMail()
    }
    
    //MARK: Mail Setup
    
    func sendMail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["j.koopman@jarict.nl"])
            self.presentViewController(mail, animated: true, completion: nil)
        } else {
            let failedMailController = UIAlertController(title: "Unable to send mail!", message: "Unable to send mail, please try again!", preferredStyle: .Alert)
            let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
            failedMailController.addAction(okButton)
            
            presentViewController(failedMailController, animated: true, completion: nil)
        }
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
