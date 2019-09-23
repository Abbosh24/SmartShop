import UIKit
import Firebase
import PKHUD
import SCLAlertView

class SignUpViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        styleTextFields()
        
    }

    //MARK: - Properties
    
    lazy var signUpLabel: UILabel =  {
        let signUpLabel = UILabel()
        signUpLabel.text = "Create new account"
        signUpLabel.textColor = green
        signUpLabel.font = avenirHeavy20
        return signUpLabel
    }()
    
    lazy var fullNameTextField: UITextField = {
        let fullNameTextField = UITextField()
        fullNameTextField.placeholder = "Full Name"
        fullNameTextField.font = avenirMedium18
        fullNameTextField.backgroundColor = .white
        fullNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        fullNameTextField.layer.borderWidth = 1
        return fullNameTextField
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.font = avenirMedium18
        phoneNumberTextField.backgroundColor = .white
        phoneNumberTextField.layer.borderColor = UIColor.lightGray.cgColor
        phoneNumberTextField.layer.borderWidth = 1
        return phoneNumberTextField
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "E-mail Address"
        emailTextField.font = avenirMedium18
        emailTextField.backgroundColor = .white
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        return emailTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = avenirMedium18
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        return passwordTextField
    }()
    
    lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 21)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = blue
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return signUpButton
    }()
    
    @objc func signUpTapped() {
        HUD.show(.progress)
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                HUD.hide()
                SCLAlertView().showError("", subTitle: error!.localizedDescription)
            } else {
                print("Registration Succeeded!")
                self.sendVerificationMail()
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
                // Notify the user that the mail has sent or couldn't because of an error.
                self.navigationController?.pushViewController(LogInViewController(), animated: true)
            })
        } else {
            HUD.hide()
        }
    }
    
    
}

extension SignUpViewController {
    func setupUI(){
        self.view.addSubview(signUpLabel)
        self.view.addSubview(fullNameTextField)
        self.view.addSubview(phoneNumberTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(signUpButton)
        
        signUpLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(calculateStatusBarNavBarHeight(navigationController: self.navigationController!) + 50)
            make.left.equalToSuperview().offset(20)
        }
        
        fullNameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(signUpLabel.snp.bottom).offset(45)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        phoneNumberTextField.snp.makeConstraints { (make) in
            make.top.equalTo(fullNameTextField.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalTo(50)
        }
        
    }
    
    func styleTextFields() {
        fullNameTextField.layer.cornerRadius = fullNameTextField.frame.width * 0.07
        phoneNumberTextField.layer.cornerRadius = phoneNumberTextField.frame.width * 0.07
        emailTextField.layer.cornerRadius = emailTextField.frame.width * 0.07
        passwordTextField.layer.cornerRadius = passwordTextField.frame.width * 0.07
        signUpButton.layer.cornerRadius = signUpButton.frame.width * 0.075
        
        phoneNumberTextField.setLeftPaddingPoints(15)
        fullNameTextField.setLeftPaddingPoints(15)
        emailTextField.setLeftPaddingPoints(15)
        passwordTextField.setLeftPaddingPoints(15)
    }
}
