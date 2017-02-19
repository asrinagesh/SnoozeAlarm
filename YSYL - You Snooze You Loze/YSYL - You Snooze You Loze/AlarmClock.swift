//
//  AlarmClock.swift
//  YSYL - You Snooze You Loze
//
//  Created by Ryan Bartruff on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import Foundation
import AVFoundation

class AlarmClock {
    var alarms : [Alarm]
    var enabled : [Alarm]
    var nextAlarm : Int
    let snoozeIncrement : Int = 5
    var snoozeTime: Int = 0
    
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
    
    func getAlarm(index : Int) -> Alarm {
        return alarms[index]
    }
    
    func removeAlarm(alarm : Alarm){
        var idx1 : Int = -1
        var idx2 : Int = -1
        
        for i in 0 ... self.alarms.count-1{
            if alarms[i].getTime() == alarm.getTime(){
                idx1 = i
            }
        }
        for i in 0 ... self.alarms.count-1{
            if alarms[i].getTime() == alarm.getTime(){
                idx2 = i
            }
        }
        
        
        alarms.remove(at: idx1)
        enabled.remove(at: idx2)
    }
    
    func addAlarm(alarm : Alarm){
        alarms = insertAlarm(alarm: alarm, alarms: alarms)
        enabled = insertAlarm(alarm: alarm, alarms: enabled)
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
    
    func wait(){
        print("wait")
        DispatchQueue.global(qos: .background).async {
            self._wait()
        }
        print("wait done")
    }
    
    func _wait(){
        
        print("_wait")
        
        var alarmTime = enabled[0].getTime()
        alarmTime += snoozeTime
        var date = Date()
        var calendar = NSCalendar.current
        var hour = calendar.component(.hour, from: date as Date)
        var minutes = calendar.component(.minute, from: date as Date)
        var curtime = hour * 60 + minutes
        
        
        while curtime < alarmTime {
            print(curtime)
            print(alarmTime)
            sleep(1)
            date = Date()
            calendar = NSCalendar.current
            hour = calendar.component(.hour, from: date as Date)
            minutes = calendar.component(.minute, from: date as Date)
            curtime = hour * 60 + minutes
            
        }
        wakeUp()
        
        print("_wakeup done")
    }
    
    func wakeUp(){
        print("wakeup")
        //self.enabled[0].setSounding(sounding: true)
        let systemSoundID: SystemSoundID = 1324
        
        // to play sound
        AudioServicesPlaySystemSound (systemSoundID)
        print("wakeup done")
        
        presentAlert(message:"Test")
    }
    
    
    func snooze(){
        print("snooze")
        snoozeTime += snoozeIncrement
        //add money
        //self.enabled[0].setSounding(sounding: false)
        wait()
        print("snooze end")
    }
    
    func stopAlarm(){
        //self.enabled[0].setSounding(sounding: false)
        self.enabled.remove(at: 0)
    }
    
    
    
    
}
