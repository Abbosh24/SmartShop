//
//  TotalTVCell.swift
//  SmartShop
//
//  Created by 1 on 9/24/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

class TotalTVCell: UITableViewCell {
    
    lazy var totalLabel: UILabel = {
    let totalLabel = UILabel()
        totalLabel.text = "Total"
        totalLabel.textColor = specialGrey
        totalLabel.font = avenirHeavy18
        return totalLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "$30"
        priceLabel.textColor = specialGrey
        priceLabel.font = avenirHeavy18
        return priceLabel
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(totalLabel)
        contentView.addSubview(priceLabel)
        
        totalLabel.snp.makeConstraints { (make) in
            make.left.equalTo(SCREEN_WIDTH*0.05)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
