//
//  AuthPresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import Foundation

protocol AuthViewProtocol: AnyObject {
    
}

protocol AuthPresenterProtocol: AnyObject {
    init(view: AuthViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, userManager: UserManagerProtocol)
    func showRegistration()
    func showTableView()
    func findeUser(login: String) -> User?
    func saveActiveUser(activeUser: User)

}

class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    var router: RouterProtocol?
    var userManager: UserManagerProtocol?
    let networkManager: NetworkManagerProtocol?
    
    required init(view: AuthViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, userManager: UserManagerProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        self.userManager = userManager
    }
    
    func showRegistration() {
        router?.showRegistrationController()
    }
    
    func showTableView() {
        router?.showTableViewController()
    }
    
    func saveActiveUser(activeUser: User) {
        userManager?.saveActiveUser(user: activeUser)
    }
    
    func findeUser(login: String) -> User? {
        
        guard let userBase = userManager?.users else { return nil }
        
        for user in userBase {
            if user.login == login {
                 return user
            }
        }
        return nil
    }
    
}
    

