//
//  AppearanceController.swift
//  Timer
//
//  Created by Diego Aguirre on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearanceDefaults() {
        
        UINavigationBar.appearance().barTintColor = UIColor.hotPink()
        UITabBar.appearance().barTintColor = UIColor.mellowOrange()
        UIButton.appearance().backgroundColor = UIColor.brightYellow()
        UIButton.appearance().tintColor = UIColor.darkGrayColor()
        

        
    }
}
