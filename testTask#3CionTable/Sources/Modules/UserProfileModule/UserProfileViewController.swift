//
//  UserProfileViewController.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 27.02.2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    var presenter: UserProfilePresenterProtocol?
    
//    MARK: - Outlets
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = .systemFont(ofSize: 26, weight: .black)
        return label
    }()
    
    private let firstNameLable: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let lastNameLable: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let loginLable: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let passwordLable: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 7
        stack.alignment = .leading
        return stack
    }()
    
//    MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        setupHierarchy()
        setupLayout()
        presenter?.getActiveUserProfile()
    }
    
//    MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubviews([titleLable, labelStack])
        labelStack.addArrangedSubviews([firstNameLable, lastNameLable, loginLable, passwordLable])
    }
    
    private func setupLayout() {
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
        }
        
        labelStack.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.centerX.centerY.equalTo(view)
        }
    }
}

//    MARK: - Extension

extension UserProfileViewController: UserProfileViewProtocol {
    
    func setActivUserProfile(user: User?) {
        firstNameLable.text = "FirstName: " + (user?.firstName ?? "No info")
        lastNameLable.text = "LastName: " + (user?.lastName ?? "No info")
        loginLable.text = "Login: " + (user?.login ?? "No info")
        passwordLable.text = "Password: " + (user?.password ?? "No info")
    }
    
}
