//
//  CategoryMealTVCell.swift
//  SmartShop
//
//  Created by 1 on 9/18/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

class CategoryMealTVCell: UITableViewCell {

    lazy var nameOfMealLabel: UILabel = {
      let nameOfMealLabel = UILabel()
        nameOfMealLabel.text = "Name of Meal"
        nameOfMealLabel.textColor = grey
        nameOfMealLabel.font = avenirMedium18
        return nameOfMealLabel
    }()
    
    lazy var descriptionOfMealLabel: UILabel = {
        let descriptionOfMealLabel = UILabel()
        descriptionOfMealLabel.text = "Description of meal"
        descriptionOfMealLabel.textColor = grey
        descriptionOfMealLabel.font = avenirSmall16
        descriptionOfMealLabel.numberOfLines = 4
        return descriptionOfMealLabel
    }()
    
    lazy var priceOfMealLabel: UILabel = {
        let priceOfMealLabel = UILabel()
        priceOfMealLabel.text = "Price"
        priceOfMealLabel.textColor = grey
        priceOfMealLabel.font = avenirSmall16
        return priceOfMealLabel
    }()
    
    lazy var mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.contentMode = .scaleAspectFit
        mealImageView.image = UIImage(named: "breakfast")
        return mealImageView
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(nameOfMealLabel)
        contentView.addSubview(descriptionOfMealLabel)
        contentView.addSubview(priceOfMealLabel)
        contentView.addSubview(mealImageView)
        
        mealImageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(-20)
            make.width.equalTo(mealImageView.snp.height)
            make.right.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
        }
        
        nameOfMealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mealImageView)
            
            make.left.equalTo(10)
        }
        
        descriptionOfMealLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(nameOfMealLabel.snp.bottom).offset(5)
            make.centerY.equalToSuperview().offset(-2)
            make.left.equalTo(10)
        }
        
        priceOfMealLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(mealImageView)
            make.left.equalTo(10)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
