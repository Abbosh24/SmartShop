import UIKit
import SideMenuSwift

class RestaurantViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = grey
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: grey, .font: avenirHeavy20]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
        
        let basketButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        navigationItem.rightBarButtonItem = basketButton

        let hamburgerButton = UIBarButtonItem(image: UIImage(named: "hamburgerButton"), style: .plain, target: self, action: #selector(hamburgerTapped))
        navigationItem.leftBarButtonItem = hamburgerButton
    }
    
    
     @objc func cartTapped() {
            let cartVC = CartViewController()
            cartVC.view.backgroundColor = .white
            self.navigationController?.pushViewController(cartVC, animated: true)
            
        }
        
        @objc func hamburgerTapped(){
            SideMenuController.preferences.basic.menuWidth = MENU_WIDTH
            self.sideMenuController?.revealMenu()
        }
    
}
