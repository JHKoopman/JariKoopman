//
//  EducationViewController.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 15/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(EducationViewController.openSideMenu))
        self.title = "Education"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func openSideMenu() {
        toggleSideMenuView()
    }
}
