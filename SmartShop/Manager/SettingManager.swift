//
//  SettingManager.swift
//  SmartShop
//
//  Created by 1 on 9/16/19.
//  Copyright © 2019 1. All rights reserved.
//

import Foundation

class SettingManager: NSObject {
    
    static let shared: SettingManager = { SettingManager() }()
    lazy var apiURL: String = {
        return "https://jsonstorage.net/api/items/4d1c10b0-dbdf-4048-8193-c9a675c00601"
    }()
    
    
    
}
