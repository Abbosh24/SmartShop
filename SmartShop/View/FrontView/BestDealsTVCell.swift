
import UIKit
import AACarousel

class BestDealsTVCell: UITableViewCell {

    lazy var mealImageSlider: AACarousel = {
        let mealImageSlider = AACarousel()
        mealImageSlider.contentMode = .scaleAspectFill
        return mealImageSlider
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(mealImageSlider)
        
        mealImageSlider.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
