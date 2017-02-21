//
//  ViewController.swift
//  YSYL - You Snooze You Loze
//
//  Created by Kelden Lin on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import UIKit
import os.log
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var userAlarmClocks = AlarmClock()
    var userAlarms : [NSManagedObject] = []

    @IBAction func snoozeAction(_ sender: Any) {
        let alert = UIAlertController(title: "Alarm!", message: "Time to wake up!!!!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Snooze", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Stop", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    // Snooze Features
    func showSnooze() {
        let alertController = DBAlertController(title: "DBAlertController", message: "Hello World!", preferredStyle: .alert)
        
        print("running")
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.show()
        print("it worked")
        //        let alert = UIAlertController(title: "Alarm!", message: "Time to wake up!!!!", preferredStyle: UIAlertControllerStyle.alert)
        //        alert.addAction(UIAlertAction(title: "Snooze", style: UIAlertActionStyle.default, handler: nil))
        //        alert.addAction(UIAlertAction(title: "Stop", style: UIAlertActionStyle.default, handler: nil))
        //        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Table View Functions
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAlarms.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmCellTableViewCell
        let currObj = userAlarmClocks.getAlarm(index: indexPath.row)
        let (hr, min) = currObj.time.getTimeInHoursMinutes()
        
        // Makes up for the 0 "space" if minutes are less than 10
        var minStr:String
        if (min < 10) {
            minStr = "0" + String(min)
        } else {
            minStr = String(min)
        }
        
        var currA = "AM"
        if currObj.time.getIsPm() { currA = "PM" }
        
        cell.alarmTime.text = String(hr) + ":" + minStr
        cell.amPm.text = currA
        
        return (cell)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Get data from core data
        getData()
        
        // Reload tableview
        tableView.reloadData()
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlarmEnti")
        let sortDescriptor = NSSortDescriptor(key: "alarmMin", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        request.returnsObjectsAsFaults = false
        userAlarmClocks = AlarmClock()
        
        do {
            userAlarms = try context.fetch(request) as! [NSManagedObject]
            // Convert minutes to Time class
            for result in userAlarms {
                let currResult = (result.value(forKey: "alarmMin") as? Int)!
                let currAlarm = Alarm(time: Time(mins: currResult), title: "Alarm", mediaLable: "Default")
                userAlarmClocks.addAlarm(alarm: currAlarm)
                print("DATA")
                print(String(describing: currResult))
                print("--")
            }
            userAlarmClocks.wait()
        }
        catch {
            // error
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlarmEnti")
        request.returnsObjectsAsFaults = false
        
        if editingStyle == .delete {
            let currAlarm = userAlarms[indexPath.row]
            print(currAlarm)
            context.delete(currAlarm)
            
            do {
                try context.save()
                userAlarms = try context.fetch(request) as! [NSManagedObject]
                
            }
            catch {
                // error
            }
            // Get data from core data
            getData()
            
            // Reload tableview
            tableView.reloadData()
        }
    }
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "SNOOZE", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("SNOOZE")
        }))
        
        alert.addAction(UIAlertAction(title: "ANSWER", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("ANSWER")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

