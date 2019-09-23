import UIKit
import Firebase
import SCLAlertView
import SideMenuSwift

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarUI()
    }
    
    @objc func cartTapped() {
        
    }
    
    @objc func hamburgerTapped(){
        //1. Set menu width
        SideMenuController.preferences.basic.menuWidth = MENU_WIDTH
        self.sideMenuController?.revealMenu()
//        self.sideMenuController?.hideMenu()
    }

}

extension MainViewController {
    
    func setupNavBarUI() {
        self.navigationController?.navigationBar.tintColor = grey
//        let signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(logOut))
//        navigationItem.rightBarButtonItem = signOutButton
        
        let basketButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        navigationItem.rightBarButtonItem = basketButton
        
        let hamburgerButton = UIBarButtonItem(image: UIImage(named: "hamburgerButton"), style: .plain, target: self, action: #selector(hamburgerTapped))
        navigationItem.leftBarButtonItem = hamburgerButton
    }
}
