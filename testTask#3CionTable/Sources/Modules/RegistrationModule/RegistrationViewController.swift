//
//  RegistrationViewController.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 22.02.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var presenter: RegistrationPresenterProtocol?

//    MARK: - Outlets
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private let maineLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let maineStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    private let viewUnderMainStack: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
//   MARK: - firsName
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let firstNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.placeholder = "Enter your name"
        field.font = .systemFont(ofSize: 18, weight: .black)
        return field
    }()
    
    private let firstNameDivader: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let firstNameValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//   MARK: - lastName
    
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let lastNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.placeholder = "Enter your last name"
        field.font = .systemFont(ofSize: 18, weight: .black)
        return field
    }()
    
    private let lastNameDivader: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let lastNameValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
//   MARK: - login

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Loging"
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
    
    private lazy var  loginTextField: UITextField = {
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
    
    private let loginValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//   MARK: - password
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter your password"
        field.delegate = self
        field.font = .systemFont(ofSize: 18, weight: .black)
        field.isSecureTextEntry = true
        return field
    }()
    
    private let passwordDivader: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let passwordValidLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    MARK: - button
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registration", for: .normal)
        button.addTarget(self, action: #selector(registrationTapButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.backgroundColor = .systemRed
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        
        registerKeyboardNotification()
        
    }
    
    deinit {
        removeKeyboardNotification()
    }
    

//    MARK: - Setups
    
    private func setupHierarchy() {
//        view.addSubview(scrollView)
//        scrollView.addSubviews([maineLabel, viewUnderMainStack, registrationButton])
        view.addSubviews([maineLabel, viewUnderMainStack, registrationButton])
        viewUnderMainStack.addSubview(maineStack)
        maineStack.addArrangedSubviews([firstNameStack, lastNameStack, loginStack, passwordStack])
        firstNameStack.addArrangedSubviews([firstNameLabel, firstNameTextField, firstNameDivader, firstNameValidLabel])
        lastNameStack.addArrangedSubviews([lastNameLabel, lastNameTextField, lastNameDivader, lastNameValidLabel])
        loginStack.addArrangedSubviews([loginLabel, loginTextField, loginDivader, loginValidLabel])
        passwordStack.addArrangedSubviews([passwordLabel, passwordTextField, passwordDivader, passwordValidLabel])
    }
    
    private func setupLayout() {
        
//        scrollView.snp.makeConstraints { make in
//            make.top.left.right.bottom.equalTo(view)
//        }
        
//        maineLabel.snp.makeConstraints { make in
//            make.top.equalTo(scrollView.safeAreaLayoutGuide).offset(20)
//            make.centerX.equalTo(scrollView)
//        }
//
//        viewUnderMainStack.snp.makeConstraints { make in
//            make.left.equalTo(scrollView).offset(20)
//            make.right.equalTo(scrollView).inset(20)
//            make.centerX.centerY.equalTo(scrollView)
//            make.height.equalTo(view).multipliedBy(0.6)
//        }
        maineLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
        }
        
        viewUnderMainStack.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.centerX.centerY.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.6)
        }
        
        maineStack.snp.makeConstraints { make in
            make.left.equalTo(viewUnderMainStack.snp.left).offset(20)
            make.right.equalTo(viewUnderMainStack.snp.right).inset(20)
            make.centerX.centerY.equalTo(viewUnderMainStack)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(30)
            make.width.equalTo(240)
            make.height.equalTo(60)
            make.centerX.equalTo(view)
        }
        
        firstNameStack.snp.makeConstraints { make in
            make.right.equalTo(maineStack.snp.right).inset(20)
            make.height.equalTo(90)
        }
        
        lastNameStack.snp.makeConstraints { make in
            make.right.equalTo(maineStack.snp.right).inset(20)
            make.height.equalTo(90)
        }
        loginStack.snp.makeConstraints { make in
            make.right.equalTo(maineStack.snp.right).inset(20)
            make.height.equalTo(90)
        }
        passwordStack.snp.makeConstraints { make in
            make.right.equalTo(maineStack.snp.right).inset(20)
            make.height.equalTo(90)
        }
        
        firstNameDivader.snp.makeConstraints { make in
            make.width.equalTo(firstNameStack.snp.width)
            make.height.equalTo(1)
        }
        
        lastNameDivader.snp.makeConstraints { make in
            make.width.equalTo(lastNameStack.snp.width)
            make.height.equalTo(1)
        }
        
        loginDivader.snp.makeConstraints { make in
            make.width.equalTo(loginStack.snp.width)
            make.height.equalTo(1)
        }
        
        passwordDivader.snp.makeConstraints { make in
            make.width.equalTo(passwordStack.snp.width)
            make.height.equalTo(1)
        }
        
    }
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidType, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
       
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        textField.text = result

        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else if textField.text == "" {
            label.text = "Required field"
            label.textColor = .black
        } else {
            label.text = wrongMessage
            label.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
//    MARK: - Action
    
    @objc func kbWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let kbFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentField = UIResponder.currentFirst() as? UITextField else { return }
        
        let kbTopY = kbFrame.cgRectValue.origin.y - 10
        let convertTextFieldFrame = view.convert(currentField.frame, from: currentField.superview)
        let textFieldBottomY = convertTextFieldFrame.origin.y + convertTextFieldFrame.size.height
        
        if textFieldBottomY > kbTopY {
            let texBoxY = convertTextFieldFrame.origin.y
            let newFrameY = (texBoxY - kbTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
//        let userInfo = notification.userInfo
//        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height / 2)
    }
    
    @objc func kbWillHide() {
        view.frame.origin.y = 0
//        scrollView.contentOffset = CGPoint.zero
    }
    
    @objc func registrationTapButton() {
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if firstName.isValid(validType: .name)
            && lastName.isValid(validType: .name)
            && login.isValid(validType: .login)
            && password.isValid(validType: .password) {
            
            presenter?.saveUser(firstName: firstName, lastName: lastName, login: login, password: password)
            alertRegistration(title: "Registration complete", message: "Welcom \(firstName)") { [weak self] in
                guard let self = self else { return }
                self.presenter?.dismiss()
            }
        } else {
            alertOk(title: "Error", message: "Fill all the textfields")
        }
    }
}


//    MARK: - Extension

extension RegistrationViewController: RegistrationViewProtocol {
    
}

//    MARK: - Delegat

extension RegistrationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
            
        case firstNameTextField:
            setTextField(textField: firstNameTextField,
                         label: firstNameValidLabel,
                         validType: .name,
                         validMessage: "Name is valid",
                         wrongMessage: "Only A-Z characters",
                         string: string,
                         range: range)
            
        case lastNameTextField:
            setTextField(textField: lastNameTextField,
                         label: lastNameValidLabel,
                         validType: .name,
                         validMessage: "Name is valid",
                         wrongMessage: "Only A-Z characters",
                         string: string,
                         range: range)
            
        case loginTextField:
            setTextField(textField: loginTextField,
                         label: loginValidLabel,
                         validType: .login,
                         validMessage: "Login is valid",
                         wrongMessage: "Login is not valid",
                         string: string,
                         range: range)
            
        case passwordTextField:
            setTextField(textField: passwordTextField,
                         label: passwordValidLabel,
                         validType: .password,
                         validMessage: "Password is valid",
                         wrongMessage: "Password is not valid",
                         string: string,
                         range: range)
            
        default:
            break

        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
}



