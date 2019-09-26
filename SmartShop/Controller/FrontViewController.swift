import UIKit
import Firebase
import SCLAlertView
import SideMenuSwift

class FrontViewController: RestaurantViewController {
    
    //MARK: - Properties
    
    let popularCategoriesCellId  = "PopularCategoriesTVCell"
    let bestDealsCellId          = "BestDealsTVCell"
    let mostPopularCellId        = "MostPopularTVCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: popularCategoriesCellId) as! PopularCategoriesTVCell
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
            return 100
        case 1, 2:
            return 225
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
