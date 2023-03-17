//
//  RegistrationPresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 22.02.2023.
//

import Foundation

protocol RegistrationViewProtocol: AnyObject {
    
}

protocol RegistrationPresenterProtocol: AnyObject {
    init(view: RegistrationViewProtocol, router: RouterProtocol, userManager: UserManagerProtocol)
    func saveUser(firstName: String, lastName: String, login: String, password: String)
    func dismiss()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view: RegistrationViewProtocol?
    var router: RouterProtocol?
    var userManager: UserManagerProtocol?
    
    required init(view: RegistrationViewProtocol, router: RouterProtocol, userManager: UserManagerProtocol) {
        self.view = view
        self.router = router
        self.userManager = userManager
    }
    
    func saveUser(firstName: String, lastName: String, login: String, password: String) {
        userManager?.saveUser(firstName: firstName, lastName: lastName, login: login, password: password)
    }
    
    func dismiss() {
        router?.dismiss()
    }

    
    
}
