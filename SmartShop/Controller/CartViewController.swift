//
//  CartViewController.swift
//  SmartShop
//
//  Created by 1 on 9/24/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit
import SideMenuSwift
import RealmSwift

class CartViewController: UIViewController {
    
    let realm = try! Realm()
    var savedItems: [CartItem]? = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var orderButton: UIButton = {
        let orderButton = UIButton()
        orderButton.setTitle("PLACE ORDER", for: .normal)
        orderButton.titleLabel?.font = avenirHeavy20
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.backgroundColor = green
//        orderButton.addTarget(self, action: #selector(makeReservationTapped), for: .touchUpInside)
        return orderButton
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        loadItems()
    }
    
    func loadItems() {
        let cartItems = self.realm.objects(CartItem.self)
        for item in cartItems {
            self.savedItems?.append(item)
            
        }
        self.tableView.reloadData()
    }
    
    func setupNavBar() {
        title = "Your cart"
    }
    
    func setupUI() {
        self.view.addSubview(tableView)
        self.view.addSubview(orderButton)
        
        let nib1 = UINib.init(nibName: "CartItemTVCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "CartItemTVCell")
        
        let nib2 = UINib.init(nibName: "TotalTVCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "TotalTVCell")
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height + (SCREEN_HEIGHT*0.03))
            make.left.right.bottom.equalToSuperview()
            
        orderButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-SCREEN_HEIGHT*0.05)
                make.left.right.equalToSuperview()
            make.height.equalTo(60)
            
            }
        }
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return savedItems?.count ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTVCell") as! CartItemTVCell
            if let savedItem = self.savedItems?[indexPath.row] {
                cell.priceLabel.text = "$\(savedItem.price)"
                cell.mealLabel.text = savedItem.title
                cell.numOfMealLabel.text = "\(savedItem.count)"
            }
            
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalTVCell") as! TotalTVCell
            var totalPrice = 0.0
            for item in savedItems! {
                totalPrice += item.price
            }
            cell.priceLabel.text = "$\(totalPrice)"
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
     
     
     
 }
