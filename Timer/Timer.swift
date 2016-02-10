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
            let totalSeconds = Int(self.seconds)
            
            let hours = totalSeconds / 3600
            let minutes = (totalSeconds - (hours * 3600)) / 60
            let seconds = totalSeconds - (hours * 3600) - (minutes * 60)
            
            var hoursString = ""
            if hours > 0 {
                hoursString = "\(hours):"
            }
            
            var minutesString = ""
            if minutes < 10 {
                minutesString = "0\(minutes):"
            } else {
                minutesString = "\(minutes):"
            }
            
            var secondsString = ""
            if seconds < 10 {
                secondsString = "0\(seconds)"
            } else {
                secondsString = "\(seconds)"
            }
            
            return hoursString + minutesString + secondsString
        }
    }
    
    func setTimer(seconds: NSTimeInterval, totalSeconds: NSTimeInterval) {
        self.totalSeconds = totalSeconds
        self.seconds = seconds
    }
    
    func startTimer() {
        if isOn != true {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "secondTick", userInfo: nil, repeats: true)
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