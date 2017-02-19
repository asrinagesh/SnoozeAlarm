//
//  AddViewController.swift
//  YSYL - You Snooze You Loze
//
//  Created by Kelden Lin on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import UIKit

class AddViewController: UIViewController{
    @IBOutlet var alarmTime: UIDatePicker!
    @IBOutlet var sampleTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarmTime.setValue(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forKeyPath: "textColor")
        alarmTime.datePickerMode = .time
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAlarm(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        sampleTime.text = formatter.string(from: alarmTime.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

