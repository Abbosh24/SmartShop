import UIKit

class PopularCategoryCVCell: UICollectionViewCell {

    lazy var mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.contentMode = .scaleAspectFill
        mealImageView.image = UIImage(named: "breakfast")
        mealImageView.clipsToBounds = true
        return mealImageView
    }()
   
    lazy var mealNameLabel: UILabel = {
        let mealNameLabel = UILabel()
        mealNameLabel.font = avenirHeavy14
        mealNameLabel.text = "Meal"
        mealNameLabel.textColor = .black
        mealNameLabel.numberOfLines = 1
        mealNameLabel.textAlignment = .center
        return mealNameLabel
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(mealImageView)
        contentView.addSubview(mealNameLabel)
       
        let widthHeightConstant: CGFloat = 70
        mealImageView.snp.makeConstraints { (make) in
           make.width.height.equalTo(widthHeightConstant)
           make.left.equalToSuperview().offset(15)
           make.top.equalToSuperview().offset(5)
        }
       
        mealNameLabel.snp.makeConstraints { (make) in
           make.top.equalTo(mealImageView.snp.bottom).offset(-0.05)
           make.centerX.equalTo(mealImageView.snp.centerX)
        }

        mealImageView.layer.cornerRadius = widthHeightConstant / 2
    }

}
