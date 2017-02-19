//
//  AddViewController.swift
//  YSYL - You Snooze You Loze
//
//  Created by Kelden Lin on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController{
    @IBOutlet var alarmTime: UIDatePicker!
    @IBOutlet var sampleTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarmTime.setValue(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forKeyPath: "textColor")
        alarmTime.datePickerMode = .time
    }
    
    @IBAction func saveAlarm(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:a"
        var timeForm = formatter.string(from: alarmTime.date)
        var timeAr = timeForm.components(separatedBy: ":")
        
        // Set all the variables
        var hr:Int = Int(timeAr[0])!
        var min:Int = Int(timeAr[1])!
        var isPm = false
        
        if timeAr[2] == "PM" {
            isPm = true
        }
        
        // If 12am -> 0
        if hr == 12 && !isPm {
            hr = 0
        }
        
        if hr != 12 && isPm  {
            hr += 12
        }
        var totMin:Int = (hr * 60) + min
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newAlarm = NSEntityDescription.insertNewObject(forEntityName: "AlarmEnti", into: context)
        newAlarm.setValue(totMin, forKey: "alarmMin")
        
        do {
            try context.save()
            print("SAVED")
        }
        catch {
            print("error")
        }
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

