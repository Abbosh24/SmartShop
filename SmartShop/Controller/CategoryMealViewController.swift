
import UIKit
import SideMenuSwift
import Kingfisher

class CategoryMealViewController: UIViewController {
    
    // MARK: - Properties
    
    //ASSIGNED FROM PREVIOUS SCREEN
    var selectedCategory: PopularCategoryModel?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpNavBar()
    }
    
    
    func setUpNavBar() {
        title = selectedCategory?.title
    }
    
    func setupUI() {
        self.view.addSubview(tableView)
        
        let nib = UINib.init(nibName: "CategoryMealTVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CategoryMealTVCell")
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height)
            make.left.right.bottom.equalToSuperview()}
    }

}

extension CategoryMealViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemsCount = selectedCategory?.items?.count {
        return itemsCount
        } else {
        return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryMealTVCell") as! CategoryMealTVCell
//        let url = URL(string: (self.restaurant?.popular_categories?[indexPath.item].image_url)!)
        cell.selectionStyle = .none
        
        if let item = selectedCategory?.items?[indexPath.item] {
        cell.nameOfMealLabel.text = item.title

        cell.descriptionOfMealLabel.text = item.details
            
            if let price = item.price {
        cell.priceOfMealLabel.text = "\(price)"
            }
            
            cell.mealImage.image = UIImage(named: "breakfast")
//      cell.mealImage.setImageFromURL()
         
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(indexPath.item)")
        if let selectedMeal = self.selectedCategory?.items?[indexPath.row]{
            
        let chosenMealVC = ChosenMealViewController()
            chosenMealVC.selectedMeal = selectedMeal
            chosenMealVC.view.backgroundColor = .white
        self.navigationController?.pushViewController(chosenMealVC, animated: true)
        }
    }
}
