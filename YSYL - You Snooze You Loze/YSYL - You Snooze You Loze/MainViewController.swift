//
//  ViewController.swift
//  YSYL - You Snooze You Loze
//
//  Created by Kelden Lin on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import UIKit
import os.log

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let alarmTimes = [6, 12, 8]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmTimes.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmCellTableViewCell
        cell.alarmTime.text = String(alarmTimes[indexPath.row]) + ":00"
        
        return (cell)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

