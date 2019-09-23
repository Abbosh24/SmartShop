import UIKit
import SideMenuSwift
import Kingfisher

class ReservationsViewController: UIViewController {
    lazy var foodImage: UIImageView = {
        let foodImage = UIImageView()
        return foodImage
    }()
    
    lazy var foodNameLabel: UILabel = {
     let foodName = UILabel()
        foodName.text = "English Breakfast"
        foodName.textColor = .black
        foodName.font = avenirHeavy20
        foodName.textAlignment = .center
        return foodName
    }()
    
    lazy var placeNameLabel: UILabel = {
        let placeNameLabel = UILabel()
        placeNameLabel.text = "Here should be your location"
        placeNameLabel.textColor = grey
        placeNameLabel.font = avenirMedium18
        placeNameLabel.textAlignment = .center
        return placeNameLabel
    }()
    
    lazy var firstNameTextField: UITextField = {
        let firstNameTextField = customTextField("First Name")
        return firstNameTextField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let lastNameTextField = customTextField("Last Name")
        return lastNameTextField
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let phoneNumberTextField = customTextField("Phone Number")
        return phoneNumberTextField
    }()
    
    lazy var reservationDetailsTextField: UITextField = {
        let reservationDetailsTextField = customTextField("Reservation Details")
        return reservationDetailsTextField
    }()
    
    lazy var makeReservationButton: UIButton = {
        let makeReservationButton = UIButton()
        makeReservationButton.setTitle("Make Reservation", for: .normal)
        makeReservationButton.titleLabel?.font = avenirHeavy20
        makeReservationButton.setTitleColor(.white, for: .normal)
        makeReservationButton.backgroundColor = green
        makeReservationButton.addTarget(self, action: #selector(makeReservationTapped), for: .touchUpInside)
        return makeReservationButton
    }()
    
    func customTextField(_ title: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = title
        textField.font = avenirMedium18
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }
    
    @objc func makeReservationTapped() {
        
    }
    
    @objc func cartTapped() {
    }

    @objc func hamburgerTapped(){
        //1. Set menu width
        SideMenuController.preferences.basic.menuWidth = MENU_WIDTH
        self.sideMenuController?.revealMenu()
        //        self.sideMenuController?.hideMenu()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        getRestaurant()
        }

    var restaurant: RestaurantModel?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        styleTextFields()
    }
    }

extension ReservationsViewController {
    
    func getRestaurant() {
        RestaurantService.shared.getRestaurant(success: { (code, restaurant) in
            self.restaurant = restaurant
            self.foodImage.setImageFromURL((self.restaurant?.restaurant_imageURL!)!)
            self.foodNameLabel.text = self.restaurant?.restaurant_name
            self.placeNameLabel.text = self.restaurant?.restaurant_address
        }) { (code) in
            print("Failed: \(code)")
      }
    }
    
    func setupNavBar() {
        title = "Reservations"
        
        let basketButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        navigationItem.rightBarButtonItem = basketButton
        
        let hamburgerButton = UIBarButtonItem(image: UIImage(named: "hamburgerButton"), style: .plain, target: self, action: #selector(hamburgerTapped))
        navigationItem.leftBarButtonItem = hamburgerButton
    }
    
    func setupUI() {
        
        
//        let viewOffset =
        
        self.view.addSubview(foodImage)
        self.view.addSubview(foodNameLabel)
        self.view.addSubview(placeNameLabel)
        self.view.addSubview(firstNameTextField)
        self.view.addSubview(lastNameTextField)
        self.view.addSubview(phoneNumberTextField)
        self.view.addSubview(reservationDetailsTextField)
        self.view.addSubview(makeReservationButton)
        
        foodImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SCREEN_HEIGHT*0.1)
            make.left.right.equalToSuperview()
            make.height.equalTo(SCREEN_HEIGHT*0.25)
        }
            
            foodNameLabel.snp.makeConstraints { (make) in
                make.top.equalTo(foodImage.snp.bottom).offset(20)
                make.left.equalToSuperview().offset(SCREEN_WIDTH*0.2)
                make.right.equalToSuperview().offset(SCREEN_WIDTH*(-0.2))
            }
        
        placeNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodNameLabel.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(SCREEN_WIDTH*0.15)
            make.right.equalToSuperview().offset(SCREEN_WIDTH*(-0.15))
        }
        
        firstNameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(placeNameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
             make.height.equalTo(40)
        }
        
        lastNameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
             make.height.equalTo(40)
        }
        
        phoneNumberTextField.snp.makeConstraints { (make) in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
             make.height.equalTo(40)
        }
        
        reservationDetailsTextField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(40)
        }
        
        makeReservationButton.snp.makeConstraints { (make) in
            make.top.equalTo(reservationDetailsTextField.snp.bottom).offset(20)
            make.left.equalTo(firstNameTextField)
            make.right.equalTo(firstNameTextField)
             make.height.equalTo(50)
        }
    }
        
        func styleTextFields() {
            firstNameTextField.layer.cornerRadius = 5
            lastNameTextField.layer.cornerRadius = 5
            phoneNumberTextField.layer.cornerRadius = 5
            reservationDetailsTextField.layer.cornerRadius = 5
            makeReservationButton.layer.cornerRadius = 5
            
            firstNameTextField.setLeftPaddingPoints(15)
            lastNameTextField.setLeftPaddingPoints(15)
            phoneNumberTextField.setLeftPaddingPoints(15)
            reservationDetailsTextField.setLeftPaddingPoints(15)
        }
    
    }

