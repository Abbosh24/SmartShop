//
//  AppDelegate.swift
//  SmartShop
//
//  Created by 1 on 9/11/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit
import SnapKit
import SideMenuSwift
import Firebase
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //PATH FOR REALM
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        window?.backgroundColor = .white
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
          FirebaseApp.configure()
        
        if Auth.auth().currentUser != nil {
            print("Logged In")
            window?.rootViewController = SideMenuController(contentViewController: UINavigationController(rootViewController: FrontViewController()), menuViewController: SideMenuViewController())
        } else {
            print("Not logged in")
            window?.rootViewController = UINavigationController(rootViewController: WelcomeViewController())
        }

        
        return true
    }

}

