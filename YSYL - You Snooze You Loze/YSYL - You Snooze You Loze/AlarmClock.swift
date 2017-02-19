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
    
    func printAlarms(){
        for i in 0...alarms.count-1 {
            let title : String = alarms[i].getTitle()
            print(title)
        }
 
    }
    
    func addAlarm(alarm : Alarm){
        alarms = insertAlarm(alarm: alarm, alarms: alarms)
    }
    
    func insertAlarm(alarm : Alarm, alarms : [Alarm]) -> [Alarm] {
        var alarmsCopy : [Alarm] = alarms
        var index = 0
        let time  = alarm.getTime()
        if(alarms.count == 0)
        {
            alarmsCopy.append(alarm)
        }
        else{
            var min = 0;
            var max = alarms.count - 1
            index = 0
            while min <= max {
                index = (max - min) / 2 + min
                if(time - alarms[index].getTime() == 0){
                    min = max + 1
                }
                else if(time - alarms[index].getTime() > 0){
                    min = index + 1
                }
                else{
                    max = index - 1
                }
                    
            }
        
        //determine which side
           if(time < alarms[index].getTime()){
                alarmsCopy.insert(alarm, at: index)
            }
            
            else{
                alarmsCopy.insert(alarm, at: index + 1)
            }
 
        }
        return alarmsCopy
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
