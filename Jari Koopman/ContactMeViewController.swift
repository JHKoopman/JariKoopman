//
//  ContactMeViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit
import MessageUI
import MapKit


class MapPin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}

class ContactMeViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var showOtherButton: UIButton!
    
    let myLocation = CLLocation(latitude: 52.81701279, longitude: 6.92053661)
    let mySchoolLocation = CLLocation(latitude: 52.511577, longitude: 6.100937)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        let myHomeCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.81701279, longitude: 6.92053661)
        let mySchoolCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.511577, longitude: 6.100937)
        let myHome: MapPin = MapPin(coordinate: myHomeCoordinates, title: "My home!")
        let mySchool: MapPin = MapPin(coordinate: mySchoolCoordinates, title: "My school!")
        
        self.title = "Contact me"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(ContactMeViewController.openSideMenu))
        centerMapOnLocation(myLocation)
        mapView.addAnnotation(myHome)
        mapView.addAnnotation(mySchool)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
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
    @IBAction func showOther(sender: AnyObject) {
        if showOtherButton.titleLabel?.text == "Show school" {
            centerMapOnLocation(mySchoolLocation)
            showOtherButton.setTitle("Show home", forState: .Normal)
        } else {
            centerMapOnLocation(myLocation)
            showOtherButton.setTitle("Show school", forState: .Normal)
        }
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
