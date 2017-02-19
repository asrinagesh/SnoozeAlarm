//
//  Alarm.swift
//  YSYL - You Snooze You Loze
//
//  Created by Ryan Bartruff on 2/18/17.
//  Copyright © 2017 Revolution 9. All rights reserved.
//

import Foundation

class Alarm {
    var enabled:Bool
    var time:Date
    var title:String
    var mediaLable:String
    var days:[Bool]
    
    init(time: Date, title:String, mediaLable:String){
        self.time = time
        enabled = true
        self.title = title
        self.mediaLable = mediaLable
        days = [false,false,false,false,false,false,false]
     }
    
    func getTime() -> Date{
        return time
    }
    
    func getTitle() -> String{
        return title
    }
    
    func getMedia() -> String{
        return mediaLable
    }
    
    func isEnabled() -> Bool{
        return enabled
    }
    
    
    
    func setTime(newTime:Date){
        time = newTime
    }
    
    func setTitle(newTitle:String){
        title = newTitle
    }
    
    func setMedia(newMedia:String){
        mediaLable = newMedia
    }
}
