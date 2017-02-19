//
//  LoginViewController.swift
//  YSYL - You Snooze You Loze
//
//  Created by Kelden Lin on 2/19/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBAction func Login(_ sender: Any) {
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

