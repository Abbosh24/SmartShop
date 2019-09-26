//
//  ViewController.swift
//  SmartShop
//
//  Created by 1 on 9/11/19.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    lazy var welcomeImage: UIImageView = {
      let welcomeImage = UIImageView()
        welcomeImage.image = UIImage(named: "cutlery.png")
        return welcomeImage
    }()
    
    lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to our restaurant"
        welcomeLabel.font = avenirHeavy20
        welcomeLabel.backgroundColor = .white
        welcomeLabel.textColor = UIColor(red: 111.0/255.0, green: 160.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        return welcomeLabel
    }()
    
    lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "Order food and make reservations with one click"
        infoLabel.font = avenirHeavy20
        infoLabel.numberOfLines = 2
        infoLabel.backgroundColor = .white
        infoLabel.textColor = grey
        infoLabel.textAlignment = .center
        return infoLabel
    }()
    
    lazy var logInButton: UIButton = {
        let logInButton = customButton("Log In", .white, green)
        logInButton.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        return logInButton
    }()
    
    lazy var signUpButton: UIButton = {
        let signUpButton = customButton("Sign Up", specialGrey, .white)
        signUpButton.layer.borderColor = grey.cgColor
        signUpButton.layer.borderWidth = 1
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return signUpButton
    }()
    
    func customButton(_ title: String ,_ titleColor: UIColor,_ backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 21)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        return button
    }
    
    override func viewDidLayoutSubviews() {
        logInButton.layer.cornerRadius = logInButton.frame.width * 0.075
        signUpButton.layer.cornerRadius = signUpButton.frame.width * 0.075
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarUI()
        setupUI()
    }
    
    
    
    @objc func logInTapped() {
        let logInVC = LogInViewController()
        logInVC.view.backgroundColor = .white
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    
    @objc func signUpTapped() {
        let signUpVC = SignUpViewController()
        signUpVC.view.backgroundColor = .white
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
  


}


extension WelcomeViewController {
    func setupNavBarUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .black
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(welcomeImage)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(infoLabel)
        self.view.addSubview(logInButton)
        self.view.addSubview(signUpButton)
        
        welcomeImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
        make.top.equalToSuperview().offset(calculateStatusBarNavBarHeight(navigationController: self.navigationController!) + 110)
            make.height.width.equalTo(80)
        }
        
        welcomeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            //            make.centerY.equalTo(350)
            make.top.equalTo(welcomeImage.snp.bottom).offset(30)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            
            make.right.equalToSuperview().offset(-40)
            //            make.right.equalToSuperview().offset(40)
            make.left.equalToSuperview().offset(40)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
        }
        
        logInButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.right.equalToSuperview().offset(-60)
            //            make.right.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(60)
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            //            make.centerY.equalTo(570)
            make.right.equalToSuperview().offset(-60)
            //            make.right.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(60)
            make.top.equalTo(logInButton.snp.bottom).offset(20)
        }
    }
}
