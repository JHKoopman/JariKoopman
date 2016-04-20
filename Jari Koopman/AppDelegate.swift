//
//  AppDelegate.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    enum ShortcutType: String {
        case about = "About"
        case contact = "Contact"
    }

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        var launchedFromShortCut = false
        // check for shortcut item
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            launchedFromShortCut = true
            handleShortcutItem(shortcutItem)
            
        }
        //Return false incase application was lanched from shorcut to prevent
        //application(_:performActionForShortcutItem:completionHandler:) from being called
        return !launchedFromShortCut
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func handleShortcutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        // get type string from shortcutItem
        if let shortcutType = ShortcutType.init(rawValue: shortcutItem.type) {
            // Get root navigation viewcontroller and its first controller
            let rootNavigationViewController = window!.rootViewController as? MyNavigationController
            let rootViewController = rootNavigationViewController?.viewControllers.first as UIViewController?
            // pop to root view controller so that approperiete seque can be performed
            rootNavigationViewController?.popToRootViewControllerAnimated(false)
            
            switch shortcutType {
            case .about:
                rootViewController?.performSegueWithIdentifier("showAbout", sender: nil)
                handled = true
            case .contact:
                rootViewController?.performSegueWithIdentifier("showContact", sender: nil)
                handled = true
            }
        }
        return handled
    }



}

