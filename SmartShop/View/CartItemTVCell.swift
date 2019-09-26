//
//  CartTVC.swift
//  SmartShop
//
//  Created by 1 on 9/24/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

class CartItemTVCell: UITableViewCell {
    
    lazy var numOfMealLabel: UILabel = {
        let numOfMealLabel = UILabel()
        numOfMealLabel.text = "1"
        numOfMealLabel.textColor = green
        numOfMealLabel.font = avenirHeavy18
        numOfMealLabel.textAlignment = .center
        numOfMealLabel.layer.borderWidth = 1
        numOfMealLabel.layer.borderColor = grey.cgColor
        return numOfMealLabel
    }()

    lazy var mealLabel: UILabel = {
    let mealLabel = UILabel()
        mealLabel.text = "The meal added to cart"
        mealLabel.textColor = specialGrey
        mealLabel.font = avenirHeavy18
        return mealLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "$10"
        priceLabel.textColor = specialGrey
        priceLabel.font = avenirHeavy18
        return priceLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(numOfMealLabel)
        contentView.addSubview(mealLabel)
        contentView.addSubview(priceLabel)
        
        numOfMealLabel.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.width.equalTo(25)
            make.left.equalTo(SCREEN_WIDTH*0.05)
        }
        
        mealLabel.snp.makeConstraints { (make) in
            make.left.equalTo(numOfMealLabel.snp.right).offset(15)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
