import UIKit
import Firebase
import SCLAlertView
import PKHUD
import SideMenuSwift

class LogInViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        styleTextFields()
        
    }
    
    lazy var logInLabel: UILabel =  {
        let logInLabel = UILabel()
        logInLabel.text = "Sign In"
        logInLabel.textColor = green
        logInLabel.font = avenirHeavy20
        return logInLabel
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "E-mail or phone number"
        emailTextField.font = avenirMedium18
        emailTextField.backgroundColor = .white
        emailTextField.layer.borderColor = grey.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        return emailTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.font = avenirMedium18
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.borderColor = grey.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = avenirHeavy20
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.backgroundColor = green
        logInButton.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        
        return logInButton
    }()
    
    @objc func logInTapped() {
        let navController = SideMenuController(contentViewController: UINavigationController(rootViewController: FrontViewController()), menuViewController: SideMenuViewController()) 
        navController.view.backgroundColor = .white
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
        HUD.show(.progress)
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                HUD.hide()
                SCLAlertView().showError("", subTitle: error!.localizedDescription)
            } else {
                print("Successed Log In!")
                
                let currentUser = Auth.auth().currentUser
                if currentUser != nil && !currentUser!.isEmailVerified {
                    HUD.hide()
                    
                    let alertView = SCLAlertView()
                    alertView.addButton("Reset Link", action: {
                        self.sendVerificationMail()
                    })
                    alertView.showWarning("Email is not verified", subTitle: "Please, verify your email first.")
                }
                if currentUser != nil && currentUser!.isEmailVerified {
                    HUD.hide()
                    let mainVC = FrontViewController()
                    mainVC.modalPresentationStyle = .fullScreen
                    self.present(FrontViewController(), animated: true)
                }
            }
        }
    }
    
    func sendVerificationMail() {
        let currentUser = Auth.auth().currentUser
        if currentUser != nil && !currentUser!.isEmailVerified {
            currentUser!.sendEmailVerification(completion: { (error) in
                HUD.hide()
                guard error == nil else {
                    SCLAlertView().showError("Could not send cofirmation link", subTitle: error!.localizedDescription)
                    return
                }
                SCLAlertView().showSuccess("One more step...", subTitle: "Open the link that was sent to your email address")
            })
        }
        else {
            HUD.hide()
        }
    }
    
}

extension LogInViewController {
    
    func setupUI(){
       self.view.addSubview(logInLabel)
       self.view.addSubview(emailTextField)
       self.view.addSubview(passwordTextField)
       self.view.addSubview(logInButton)
        
        logInLabel.snp.makeConstraints { (make) in
            
     make.top.equalToSuperview().offset(calculateStatusBarNavBarHeight(navigationController: self.navigationController!) + 50)
     make.left.equalToSuperview().offset(20)
            
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logInLabel.snp.bottom).offset(45)
            make.left.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-35)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-35)
            make.height.equalTo(40)
        }
        
        logInButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalTo(50)
        }
    }
    
    func styleTextFields() {
        emailTextField.layer.cornerRadius = emailTextField.frame.width * 0.07
        passwordTextField.layer.cornerRadius = passwordTextField.frame.width * 0.07
        logInButton.layer.cornerRadius = logInButton.frame.width * 0.075
        
        emailTextField.setLeftPaddingPoints(15)
        passwordTextField.setLeftPaddingPoints(15)
    }
    
}
