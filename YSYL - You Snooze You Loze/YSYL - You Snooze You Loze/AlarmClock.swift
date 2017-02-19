//
//  AlarmClock.swift
//  YSYL - You Snooze You Loze
//
//  Created by Ryan Bartruff on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import Foundation

class AlarmClock {
    var alarms : [Alarm]
    var enabled : [Alarm]
    var nextAlarm : Int
    
    init(){
        alarms = []
        enabled = []
        nextAlarm = 0
    }
    
    func addAlarm(alarm : Alarm){
        insertSorted(alarm: <#T##Alarm#>, alarms: <#T##[Alarm]#>)
    }
    
    func insertSorted(alarm : Alarm, alarms : [Alarm]){
        var time  = alarm.getTime()
        for i in 0...alarms.count {
            if(){
                
            }
        }
    }
    
    func wakeUp(){
        
    }
    
    func snooze(){
        
    }
    
    func stopAlarm(){
        
    }
    
    func stop(){
        
    }
}
