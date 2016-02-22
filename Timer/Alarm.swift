//
//  Alarm.swift
//  Timer
//
//  Created by Dylan Slade on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Alarm: NSObject {
    static let notificationComplete = "notificationComplete"
    static let catagoryAlarm = "catagoryAlarm"
    static let cancelAlarm = "cancelAlarm"
    
    var timer = Timer()
    private(set) var alarmDate: NSDate?
    var isArmed:  Bool {
        get {
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        }
    }
    private var localNotification: UILocalNotification?
    
    
    func arm(fireDate: NSDate) {
        alarmDate = fireDate
        let alarmNotification = UILocalNotification()
        alarmNotification.fireDate = alarmDate
        alarmNotification.timeZone = NSTimeZone.localTimeZone()
        alarmNotification.soundName = "sms-received3.caf"
        alarmNotification.alertBody = "Alarm Complete"
        alarmNotification.category = Alarm.catagoryAlarm
        
        UIApplication.sharedApplication().scheduleLocalNotification(alarmNotification)
    }
    
     func cancel() {
        if isArmed {
            alarmDate = nil
            if let localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
    
    
    static func alarmComplete() {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationComplete, object: self)
    }
    
    
    
    
    
    
    
     
    
    
}
