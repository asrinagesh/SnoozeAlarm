//
//  Time.swift
//  YSYL - You Snooze You Loze
//
//  Created by Ryan Bartruff on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import Foundation

class Time {
    var time:Int

    init(time:Int){
        self.time = time
    }
    
    func getTime() -> Int{
        return time
    }
    
    func setTime(newTime:Int){
        time = newTime
    }
    
    func getHours() -> Int{
        let hours = time / 60
        if hours > 12{
            return hours - 12
        }
        else{
            return hours
        }
    }
    
    func getMinutes() -> Int{
        return time % 60
    }
    
    func getTimeInMinutes(hours:Int, minutes:Int) -> Int{
        return (hours * 60) + minutes
    }
}
