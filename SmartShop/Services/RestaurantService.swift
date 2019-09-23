//
//  InfoService.swift
//  SmartShop
//
//  Created by 1 on 9/16/19.
//  Copyright © 2019 1. All rights reserved.
//

import Foundation
import Alamofire

class RestaurantService: NSObject {
    
    static let shared: RestaurantService = { RestaurantService() }()
    
    func getRestaurant(success: @escaping (Int, RestaurantModel) -> (), failure: @escaping (Int) -> ()) {
        APIClient.shared.get(success: { (code, restaurant) in
            success(code, restaurant!)
        }) { (code) in
            failure(code)
        }
    }
    
}
