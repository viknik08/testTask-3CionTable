//
//  UserProfilePresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 27.02.2023.
//

import Foundation

protocol UserProfileViewProtocol: AnyObject {
    func setActivUserProfile(user: User?)
}

protocol UserProfilePresenterProtocol: AnyObject {
    init(view: UserProfileViewProtocol, userManager: UserManagerProtocol, router: RouterProtocol)
    func getActiveUserProfile()
}

class UserProfilePresenter: UserProfilePresenterProtocol {

    weak var view: UserProfileViewProtocol?
    var userManager: UserManagerProtocol?
    var router: RouterProtocol?
    
    required init(view: UserProfileViewProtocol, userManager: UserManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.userManager = userManager
    }
    
    func getActiveUserProfile() {
        let activUser = userManager?.activeUser
        view?.setActivUserProfile(user: activUser)
    }
    
  
}
