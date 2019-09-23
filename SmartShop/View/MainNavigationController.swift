//
//  MainNavigationViewController.swift
//  SmartShop
//
//  Created by 1 on 9/12/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationBar.tintColor = grey
        // Do any additional setup after loading the view.
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: grey, .font: avenirHeavy20]
        self.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
}
