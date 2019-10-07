import UIKit

class MenuCVCell: UICollectionViewCell {
    
    // MARK: Properties
    
    lazy var foodNameLabel: UILabel = {
        let foodName = UILabel()
        foodName.text = "English Breakfast"
        foodName.textColor = .white
        foodName.font = avenirHeavy20
        foodName.textAlignment = .center
        return foodName
    }()
    
    lazy var foodImageView: UIImageView = {
        let foodImageView = UIImageView()
        foodImageView.contentMode = .scaleAspectFill
        foodImageView.image = UIImage(named: "breakfast")
        return foodImageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.addSubview(foodImageView)
       
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        foodImageView.addSubview(tintView)
        foodImageView.addSubview(foodNameLabel)
        
        foodImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        tintView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        foodNameLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }

}

