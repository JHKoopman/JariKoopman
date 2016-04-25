//
//  MySideMenuTableViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class MyMenuTableViewController: UITableViewController {
    var selectedMenuItem : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 8
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if (cell == nil) {
            let blurEffect = UIBlurEffect(style: .Dark)
            let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
            let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.whiteColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            vibrancyEffectView.contentView.addSubview(selectedBackgroundView)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        switch (indexPath.row) {
        case 0:
            cell?.textLabel?.text = "Home"
            break
        case 1:
            cell!.textLabel?.text = "About me"
            break
        case 2:
            cell!.textLabel?.text = "Things I've done"
            break
        case 3:
            cell?.textLabel?.text = "WWDC"
            break
        case 4:
            cell?.textLabel?.text = "Education"
            break
        case 5:
            cell?.textLabel?.text = "Family"
            break
        case 6:
            cell?.textLabel?.text = "Skills"
            break
        default:
            cell!.textLabel?.text = "Contact me"
            break
            
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("did select row: \(indexPath.row)")
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainViewController")
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AboutMeViewController")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AchievementsViewController")
            break
        case 3:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("WWDCViewController")
            break
        case 4:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("EducationViewController")
            break
        case 5:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("FamilyViewController")
            break
        case 6:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SkillsViewController")
            break
        default:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ContactMeViewController")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
}
