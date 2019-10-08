//
//  ChosenMealViewController.swift
//  SmartShop
//
//  Created by 1 on 9/18/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit
import SnappingStepper
import Kingfisher
import SCLAlertView
import RealmSwift


class ChosenMealViewController: SuperCartViewController {
    
    var selectedMeal: Item?
    let realm = try! Realm()
    
    lazy var mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.contentMode = .scaleAspectFill
        let url = URL(string: (self.selectedMeal?.image_url)!)
        mealImageView.setImageFromURL(self.selectedMeal!.image_url!)
        return mealImageView
    }()
    
    lazy var descriptionOfMealLabel: UILabel = {
        let descriptionOfMealLabel = UILabel()
        descriptionOfMealLabel.text = selectedMeal?.details
        descriptionOfMealLabel.textColor = grey
        descriptionOfMealLabel.font = avenirMedium18
        descriptionOfMealLabel.numberOfLines = 0
        return descriptionOfMealLabel
    }()
    
    lazy var stepper: SnappingStepper = {
        let stepper = SnappingStepper()
        stepper.continuous   = true
        stepper.autorepeat   = true
        stepper.wraps        = false
        stepper.minimumValue = 1
        stepper.maximumValue = 100
        stepper.stepValue    = 1
        stepper.style = .rounded
        
        stepper.symbolFont           = UIFont(name: "TrebuchetMS-Bold", size: 20)
        stepper.symbolFontColor      = .black
        stepper.layer.borderColor = grey.cgColor
        stepper.layer.borderWidth = 1
        stepper.backgroundColor      = .white
        stepper.thumbWidthRatio      = 0.5
        stepper.thumbText            = "\(Int(stepper.value))"
        stepper.thumbFont            = UIFont(name: "TrebuchetMS-Bold", size: 20)
        stepper.thumbBackgroundColor = .white
        stepper.thumbTextColor       = .black
        
        stepper.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return stepper
    }()
    
    lazy var priceOfMealLabel: UILabel = {
        let priceOfMealLabel = UILabel()
        priceOfMealLabel.text = "$\(selectedMeal!.price!)"
        priceOfMealLabel.textColor = grey
        priceOfMealLabel.font = avenirHeavy20
        priceOfMealLabel.layer.borderColor = grey.cgColor
        priceOfMealLabel.layer.borderWidth = 1
        priceOfMealLabel.textAlignment = .center
        return priceOfMealLabel
    }()
    
    lazy var addToCartButton: UIButton = {
        let addToCartButton = UIButton()
        addToCartButton.setTitle("Add To Cart", for: .normal)
        addToCartButton.titleLabel?.font = avenirHeavy20
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.backgroundColor = green
        addToCartButton.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        return addToCartButton
    }()
    
    @objc func valueChanged(sender: AnyObject) {
        
        print(stepper.value)
        stepper.thumbText = "\(Int(stepper.value))"
        priceLabelChenged()
    }
        
    func priceLabelChenged() {
            priceOfMealLabel.text = "$\(stepper.value*selectedMeal!.price!)"
    }
    
    @objc func addToCartTapped() {
        
        do {
            try self.realm.write {
                let newCartItem = CartItem(title: selectedMeal!.title!, price: stepper.value*selectedMeal!.price!, count: Int(stepper.value))
                self.realm.add(newCartItem)
                //SAVED CART ITEM TO REALM
            }
        } catch {
            
        }
            
        
        let alertView = SCLAlertView()
        
        alertView.showSuccess("Success!", subTitle: "Added to cart!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        styleTextFields()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
 
}

extension ChosenMealViewController{
    
    func setupNavBar() {
        title = selectedMeal?.title
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(mealImageView)
        self.view.addSubview(descriptionOfMealLabel)
        self.view.addSubview(stepper)
        self.view.addSubview(priceOfMealLabel)
        self.view.addSubview(addToCartButton)
        
        mealImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SCREEN_WIDTH*0.1)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(SCREEN_HEIGHT*0.25)
        }
        
        descriptionOfMealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mealImageView.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        stepper.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionOfMealLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(150)
            make.right.equalToSuperview().offset(-150)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        priceOfMealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stepper.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(45)
            make.width.equalTo(SCREEN_WIDTH*0.2)
        }
        
        addToCartButton.snp.makeConstraints { (make) in
            make.top.equalTo(priceOfMealLabel)
            make.left.equalTo(priceOfMealLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
    }
    
    func styleTextFields() {
        stepper.layer.cornerRadius = 20
        priceOfMealLabel.layer.cornerRadius = 5
        addToCartButton.layer.cornerRadius = 5
    }
    
}
