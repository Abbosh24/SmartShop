//
//  ChosenMealViewController.swift
//  SmartShop
//
//  Created by 1 on 9/18/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit
import SnappingStepper

class ChosenMealViewController: UIViewController {
    
    var selectedMeal: Item?
    
    lazy var mealImage: UIImageView = {
        let mealImage = UIImageView()
        mealImage.contentMode = .scaleAspectFill
        mealImage.image = UIImage(named: "breakfast")
        return mealImage
    }()
    
    lazy var descriptionOfMealLabel: UILabel = {
        let descriptionOfMealLabel = UILabel()
        descriptionOfMealLabel.text = "Description of meal"
        descriptionOfMealLabel.textColor = grey
        descriptionOfMealLabel.font = avenirMedium18
        descriptionOfMealLabel.numberOfLines = 3
        return descriptionOfMealLabel
    }()
    
    lazy var stepper: SnappingStepper = {
        let stepper = SnappingStepper()
        stepper.continuous   = true
        stepper.autorepeat   = true
        stepper.wraps        = false
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue    = 1
        stepper.style = .rounded
        
        stepper.symbolFont           = UIFont(name: "TrebuchetMS-Bold", size: 20)
        stepper.symbolFontColor      = .black
        stepper.backgroundColor      = green
        stepper.thumbWidthRatio      = 0.5
        stepper.thumbText            = ""
        stepper.thumbFont            = UIFont(name: "TrebuchetMS-Bold", size: 20)
        stepper.thumbBackgroundColor = blue
        stepper.thumbTextColor       = .black
        
        stepper.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return stepper
    }()
    
    lazy var priceOfMealLabel: UILabel = {
        let priceOfMealLabel = UILabel()
        priceOfMealLabel.text = "Price"
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
//        addToCartButton.addTarget(self, action: #selector(addToCarTapped), for: .touchUpInside)
        return addToCartButton
    }()
    
    @objc func valueChanged(sender: AnyObject) {
        
        print(stepper.value)
        stepper.thumbText = "\(Int(stepper.value))"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
 
}

extension ChosenMealViewController{
    
    func setupUI() {
        
        self.view.addSubview(mealImage)
        self.view.addSubview(descriptionOfMealLabel)
        self.view.addSubview(stepper)
        self.view.addSubview(priceOfMealLabel)
        self.view.addSubview(addToCartButton)
        
        mealImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SCREEN_WIDTH*0.1)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(SCREEN_HEIGHT*0.25)
        }
        
        descriptionOfMealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mealImage.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        stepper.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionOfMealLabel.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(120)
            make.right.equalToSuperview().offset(-120)
            make.width.equalTo(100)
            make.height.equalTo(40)
            
        }
        
        priceOfMealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stepper.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(45)
            make.width.equalTo(SCREEN_WIDTH*0.2)
        }
        priceOfMealLabel.layer.cornerRadius = 5
        
        addToCartButton.snp.makeConstraints { (make) in
            make.top.equalTo(priceOfMealLabel)
            make.left.equalTo(priceOfMealLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
        addToCartButton.layer.cornerRadius = 5
    }
    
     
    
}
