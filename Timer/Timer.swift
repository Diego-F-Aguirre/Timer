//
//  Timer.swift
//  Timer
//
//  Created by Dylan Slade on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    static let notificationSecondTick = "TimeNotificatinSecondTick"
    static let notificationComplete = "TimerNotificationComplete"
    
    private(set) var seconds = NSTimeInterval(0)
    private(set) var totalSeconds = NSTimeInterval(0)
    private var timer: NSTimer?
    var isOn: Bool {
        get {
            if timer != nil {
                return true
            } else {
                return false
            }
        }
    }
    var readableTime: String {
        get {
            let totalSeconds = Int(self.seconds) // Good to know we can cast NSTimeInterval as an Int
            
            let hours = totalSeconds / 3600
            let minutes = totalSeconds / 360
            let seconds = totalSeconds - (totalSeconds * 3600) - (minutes * 360)
            
            var hourString = ""
            if hours > 0 {
                hourString = "0\(minutes)"
            }
            
            var minuteString = ""
            if minutes > 10 {
                minuteString = "\(minutes)"
            } else {
                minuteString = "0\(minutes)"
            }
            
            var secondString = ""
            if seconds > 10 {
                secondString = "\(seconds)"
            } else {
                secondString = "0\(seconds)"
            }
            
            return hourString + ":" + minuteString + ":" + secondString
        }
    }
    
    func setTimer(seconds: NSTimeInterval, totalSeconds: NSTimeInterval) {
        self.totalSeconds = totalSeconds
        self.seconds = seconds
    }
    
    func startTimer() {
        if isOn != true {
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "", userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if isOn {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func secondTick() {
        seconds--
        NSNotificationCenter.defaultCenter().postNotificationName(Timer.notificationSecondTick, object: self)
        if seconds <= 0 {
            stopTimer()
        NSNotificationCenter.defaultCenter().postNotificationName(Timer.notificationComplete, object: self)
        }
        
    }
}