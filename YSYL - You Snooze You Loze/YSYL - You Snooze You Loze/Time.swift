//
//  Time.swift
//  YSYL - You Snooze You Loze
//
//  Created by Ryan Bartruff on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import Foundation

class Time {
    var totMins:Int
    var isPm = false

    init(mins:Int){
        self.totMins = mins
    }
    
    func getTime() -> Int{
        return self.totMins
    }
    
    func setTime(newTime:Int){
        self.totMins = newTime
    }
    
    func getHours() -> Int{
        let hours = self.totMins / 60
        // If 12am -> 0
        if hours == 12 && !isPm {
            return 0
        }
        
        // If at the PM -> minus 12
        if hours > 12 {
            isPm = true
            return hours - 12
        }
        else{
            isPm = false
            return hours
        }
    }
    
    func getMinutes() -> Int{
        return self.totMins % 60
    }
    
    func getIsPm() -> Bool{
        return isPm
    }
    
//    func getTimeInMinutes(hours:Int, minutes:Int) -> Int{
//        return (hours * 60) + minutes
//    }
    
    func getTimeInHoursMinutes() -> (hours:Int, minutes:Int) {
        return (self.getHours(), self.getMinutes())
    }
}
