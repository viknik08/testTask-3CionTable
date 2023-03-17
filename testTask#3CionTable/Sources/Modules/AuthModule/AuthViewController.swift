//
//  AuthViewController.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    var presenter: AuthPresenterProtocol?
    
//    MARK: - Outlets
    
    private let viewImage: UIImageView = {
        let image = UIImage(named: "crypto")?.blur(5)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.3
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, enter your login"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10
        label.layer.shouldRasterize = true
        label.layer.rasterizationScale = UIScreen.main.scale
        return label
    }()
    
    private let viewUnderLoginPassword: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
//    MARK: - Login Stack
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let loginStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var loginTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.placeholder = "Enter your login"
        field.font = .systemFont(ofSize: 18, weight: .black)
        return field
    }()
    
    private let loginDivader: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
//    MARK: - Password Stack

    private let passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.placeholder = "Enter your password"
        field.font = .systemFont(ofSize: 18, weight: .black)
        field.isSecureTextEntry = true
        return field
    }()
    
    private let passwordDivader: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
//    MARK: - Buttons
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(loginTapButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registration", for: .normal)
        button.addTarget(self, action: #selector(registrationTapButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)

        return button
    }()
    
    private let registrationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        return stack
    }()
    
    private let registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "If you don`t have an account, please"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    

    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
    }
    
//    MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubviews([viewImage, titleLabel, logInButton, viewUnderLoginPassword])
        viewUnderLoginPassword.addSubview(mainStack)
        mainStack.addArrangedSubviews([loginStack, passwordStack])
        loginStack.addArrangedSubviews([loginLabel, loginTextField, loginDivader])
        passwordStack.addArrangedSubviews([passwordLabel, passwordTextField, passwordDivader])
        view.addSubview(registrationStack)
        registrationStack.addArrangedSubviews([registrationLabel, registrationButton])
    }
    
    private func setupLayout() {
        viewImage.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(view)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.bounds.height / 5)
            make.centerX.equalTo(view)
        }
        
        viewUnderLoginPassword.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.height.equalTo(view.bounds.height / 3)
        }
        
        mainStack.snp.makeConstraints { make in
            make.height.equalTo(viewUnderLoginPassword).multipliedBy(0.6)
            make.centerX.centerY.equalTo(viewUnderLoginPassword)
        }
        
        loginStack.snp.makeConstraints { make in
            make.left.equalTo(viewUnderLoginPassword.snp.left).offset(20)
            make.right.equalTo(viewUnderLoginPassword.snp.right).inset(20)
            make.centerX.equalTo(viewUnderLoginPassword)
        }
        
        loginDivader.snp.makeConstraints { make in
            make.width.equalTo(loginStack.snp.width)
            make.height.equalTo(1)
        }
        
        passwordDivader.snp.makeConstraints { make in
            make.width.equalTo(passwordStack.snp.width)
            make.height.equalTo(1)
        }
        
        passwordStack.snp.makeConstraints { make in
            make.left.equalTo(viewUnderLoginPassword.snp.left).offset(20)
            make.right.equalTo(viewUnderLoginPassword.snp.right).inset(20)
            make.centerX.equalTo(viewUnderLoginPassword)
        }
        
        registrationStack.snp.makeConstraints { make in
            make.top.equalTo(viewUnderLoginPassword.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(40)
        }
        
        logInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(60)
            make.width.equalTo(240)
        }
    }

    
//    MARK: - Action

    @objc func loginTapButton() {
        
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let user = presenter?.findeUser(login: login)
        
        if user == nil {
            alertOk(title: "Error", message: "User not found")
        } else if user?.password == password {
            presenter?.showTableView()
            
            guard let activeUser = user else { return }
            presenter?.saveActiveUser(activeUser: activeUser)
        }
        
    }
    
    @objc func registrationTapButton() {
        presenter?.showRegistration()
    }
}

//    MARK: - Lifecycle

extension AuthViewController: AuthViewProtocol {
    
}

//    MARK: - Delegat

extension AuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginTextField.resignFirstResponder()
        if !passwordTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
}
