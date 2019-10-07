
import UIKit

class MostPopularTVCell: UITableViewCell {

    lazy var mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.contentMode = .scaleAspectFit
        mealImageView.image = UIImage(named: "breakfast")
        return mealImageView
    }()
    
    lazy var mealNameLabel: UILabel = {
        let mealNameLabel = UILabel()
        mealNameLabel.font = avenirHeavy18
        mealNameLabel.text = "Name of Meal"
        mealNameLabel.textColor = .black
        return mealNameLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = avenirHeavy18
        priceLabel.text = "Price"
        priceLabel.textColor = .black
        return priceLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(mealImageView)
        contentView.addSubview(mealNameLabel)
        contentView.addSubview(priceLabel)
        
        mealImageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(-20)
            make.width.equalTo(mealImageView.snp.height)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        mealNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mealImageView.snp.bottom).offset(1)
            make.left.equalTo(mealImageView.snp.left)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mealNameLabel)
            make.right.equalTo(mealImageView.snp.right)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
