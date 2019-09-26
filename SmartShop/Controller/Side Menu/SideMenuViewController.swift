import UIKit
import Firebase
import SCLAlertView
import SideMenuSwift

class SideMenuViewController: UIViewController {
    
    
    //MARK: - Properties
    
    lazy var homeButton: UIButton = {
        let homeButton = customButton("Home", UIImage(named: "home")!)
         homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        
        return homeButton
    }()
    
    lazy var menuButton: UIButton = {
        let menuButton = customButton("Menu", UIImage(named: "menu")!)
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        return menuButton
    }()
    
    lazy var searchButton: UIButton = {
        let searchButton = customButton("Search", UIImage(named: "search")!)
        return searchButton
    }()
    
    lazy var cartButton: UIButton = {
        let cartButton = customButton("Cart", UIImage(named: "cart50px")!)
        return cartButton
    }()
    
    lazy var reservationsButton: UIButton = {
        let reservationsButton = customButton("Reservations", UIImage(named: "reservations")!)
        reservationsButton.addTarget(self, action: #selector(reservationsTapped), for: .touchUpInside)
        return reservationsButton
    }()
    
    lazy var ordersButton: UIButton = {
        let ordersButton = customButton("Orders", UIImage(named: "orders")!)
        return ordersButton
    }()
    
    lazy var logOutButton: UIButton = {
        let logOutButton = customButton("Logout", UIImage(named: "logout")!)
        logOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        return logOutButton
    }()
    
    func customButton(_ title: String, _ image: UIImage) -> UIButton {
        let button = UIButton()
        // Removing the need for capital letters
        button.setTitle(title.uppercased(), for: .normal)
        button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        // Setting the spacing between button title and image
        button.centerTextAndImage(spacing: 20)
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 19)
     
        button.setTitleColor(specialGrey, for: .normal)
        button.tintColor = specialGrey
        return button
    }
    
    //MARK: - HELPERS
    
    func parent() -> UIViewController {
        let parentMenuC = self.parent as? SideMenuController
        let contentNC = parentMenuC?.contentViewController as? UINavigationController
        return contentNC!.viewControllers[0]
    }
    
    func presentUILayer(_ contentViewController: UINavigationController, _ menuViewController: UIViewController? = SideMenuViewController(), _ modalPresentationStyle: UIModalPresentationStyle? = .fullScreen) {
        
        self.sideMenuController?.hideMenu()
        
        let sideMenuController = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController!)
        sideMenuController.modalPresentationStyle = modalPresentationStyle!
        
         self.present(sideMenuController, animated: false, completion: nil)
    }
    
    //MARK: - ACTIONS
    
    @objc func homeButtonTapped() {
        presentUILayer(UINavigationController(rootViewController: FrontViewController()))
    }
    
    @objc func menuTapped() {
        presentUILayer(UINavigationController(rootViewController: MenuViewController()))
    }
    
    @objc func reservationsTapped() {
        presentUILayer(UINavigationController(rootViewController: ReservationsViewController()))
    }
    
    
    @objc func logOutTapped() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            SCLAlertView().showError("", subTitle: error.localizedDescription)
        }
        let navCrWelcome = UINavigationController(rootViewController: WelcomeViewController())
        navCrWelcome.modalPresentationStyle = .fullScreen
        self.present(navCrWelcome, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        setupUI()
    }
    
    }
    
    extension SideMenuViewController {
    
    func setupUI() {
        self.view.addSubview(homeButton)
        self.view.addSubview(menuButton)
        self.view.addSubview(searchButton)
        self.view.addSubview(cartButton)
        self.view.addSubview(reservationsButton)
        self.view.addSubview(ordersButton)
        self.view.addSubview(logOutButton)
        
        // Getting button offset. 100% - 70% = 30%. We shift all buttons 30% of screen width to left. And add 10 to make it look good.
 
        let buttonOffset = SCREEN_WIDTH - MENU_WIDTH + 20
       
        homeButton.snp.makeConstraints { (make) in
            // Start menu 25% of screen height from TOP
            make.top.equalToSuperview().offset(SCREEN_HEIGHT * 0.25)
            make.left.equalToSuperview().offset(buttonOffset)
        }
        
        menuButton.snp.makeConstraints { (make) in
            make.top.equalTo(homeButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(buttonOffset)
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(menuButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(buttonOffset)
        }
        
        cartButton.snp.makeConstraints { (make) in
            make.top.equalTo(searchButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(buttonOffset)
        }
        
        reservationsButton.snp.makeConstraints { (make) in
            make.top.equalTo(cartButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(buttonOffset)
        }
        
        ordersButton.snp.makeConstraints { (make) in
            make.top.equalTo(reservationsButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(buttonOffset)
        }
        
        logOutButton.snp.makeConstraints { (make) in
            make.top.equalTo(ordersButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(buttonOffset)
        }

    }
}
