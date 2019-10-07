import UIKit
import Firebase
import SCLAlertView
import SideMenuSwift
import Kingfisher
import AACarousel

class FrontViewController: RestaurantViewController {
    
    //MARK: - Properties
    
    let popularCategoriesCellId  = "PopularCategoriesTVCell"
    let bestDealsCellId          = "BestDealsTVCell"
    let mostPopularCellId        = "MostPopularTVCell"
    
    //1. Create a var
    var popularCategories: [PopularCategoryModel]?
    var bestDeals: [BestDealsModel]?
    
    var imagePaths: [String] = []
    var bestDealsImagesPaths: [(String, String)] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //2. Implement get data method
    func getData() {
        RestaurantService.shared.getRestaurant(success: { (code, restaurant) in
            
            //POPULAR CATEGORIES
            self.popularCategories = restaurant.popular_categories
            for category in self.popularCategories! {
                self.imagePaths.append(category.image_url!)
            }
            print("Image paths of popular categories: \(self.imagePaths)")
            
            
            //BEST DEALS
            self.bestDeals = restaurant.best_deals
            
            for bestDeal in self.bestDeals! {
            self.bestDealsImagesPaths.append((bestDeal.deal_title ?? "", bestDeal.deal_image_url ?? ""))
            }
            
            print("image paths of best deals: \(self.bestDealsImagesPaths)")
            
            self.displayBestDeals()
            self.tableView.reloadData()
        }) { (code) in }
    }
    
    func displayBestDeals() {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! BestDealsTVCell
        cell.mealImageSlider.delegate = self
        
        let titles = self.bestDeals!.map({
            return $0.deal_title
        })
        let imageUrls = self.bestDeals!.map({
            return $0.deal_image_url
        })
        
        cell.mealImageSlider.setCarouselData(paths: imageUrls as! [String], describedTitle: titles as! [String], isAutoScroll: true, timer: 5.0, defaultImage: "breakfast")
        self.tableView.reloadData()
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}


//MARK: - Table View Delegate & Data Source

extension FrontViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: popularCategoriesCellId, for: indexPath) as! PopularCategoriesTVCell
            //5. Assign the var in cell
            cell.popularCategories = self.popularCategories
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: bestDealsCellId) as! BestDealsTVCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: mostPopularCellId) as! MostPopularTVCell
            return cell
        default: return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Popular Categories"
        case 1:
            return "Best Deals"
        case 2:
            return "Most Popular"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 110
        case 1:
            return 250
        case 2:
            return 300
        default: return 0
        }
    }
    
}

//MARK: - UI Setup

extension FrontViewController {
    
    func setupUI() {
        self.view.addSubview(tableView)
        
        let popularCategoriesNib = UINib.init(nibName: popularCategoriesCellId, bundle: nil)
        let bestDealsNib = UINib.init(nibName: bestDealsCellId, bundle: nil)
        let mostPopularNib = UINib.init(nibName: mostPopularCellId, bundle: nil)
        
        self.tableView.register(popularCategoriesNib, forCellReuseIdentifier: popularCategoriesCellId)
        self.tableView.register(bestDealsNib, forCellReuseIdentifier: bestDealsCellId)
        self.tableView.register(mostPopularNib, forCellReuseIdentifier: mostPopularCellId)
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension FrontViewController: AACarouselDelegate {
    
    func didSelectCarouselView(_ view: AACarousel, _ index: Int) {
        
    }
    
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
    }
    
    func downloadImages(_ url: String, _ index: Int) {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! BestDealsTVCell
        cell.mealImageSlider.delegate = self
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            cell.mealImageSlider.images[index] = downloadImage!
        })
    }
    
    
}
