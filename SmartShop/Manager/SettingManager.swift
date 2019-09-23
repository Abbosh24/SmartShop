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
        return "https://jsonstorage.net/api/items/b5cfd5ee-d94f-4eac-ad8f-fe9d48ef7d8b"
    }()
    
    
    
}
