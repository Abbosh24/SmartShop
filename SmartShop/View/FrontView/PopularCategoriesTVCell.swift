import UIKit
import Kingfisher

class PopularCategoriesTVCell: UITableViewCell {

    let popularCategoryCellId = "PopularCategoryCVCell"
    var parentController: UIViewController?
    var popularCategories: [PopularCategoryModel]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 95, height: 110)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
//   seriy cvet custom viewForHeader
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Count: \(self.popularCategories?.count)")
        contentView.addSubview(collectionView)
        
        let nib = UINib.init(nibName: popularCategoryCellId, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: popularCategoryCellId)
        
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PopularCategoriesTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.popularCategories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCategoryCellId, for: indexPath) as! PopularCategoryCVCell
        cell.mealImageView.setImageFromURL(self.popularCategories?[indexPath.item].image_url ?? "")
        
        cell.mealNameLabel.text = self.popularCategories?[indexPath.item].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let selectedCategory = self.popularCategories?[indexPath.item] {
            
            let categoryMealsVC = CategoryMealViewController()
            categoryMealsVC.selectedCategory = selectedCategory
            self.parentController?.navigationController?.pushViewController(categoryMealsVC, animated: true)
        }
        
    }
        
    }
