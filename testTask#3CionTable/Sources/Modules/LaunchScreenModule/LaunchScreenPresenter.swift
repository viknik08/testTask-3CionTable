//
//  launchScreenPresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import Foundation
import UIKit

protocol LaunchScreenViewProtocol: AnyObject {
    func updataViewData(_ data: ViewData)
}

protocol LaunchScreenPresenterProtocol: AnyObject {
    init(view: LaunchScreenViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, userManager: UserManagerProtocol)
    func isAuth()
}

class LaunchScreenPresenter: LaunchScreenPresenterProtocol {
    
    weak var view: LaunchScreenViewProtocol?
    var router: RouterProtocol?
    var userManager: UserManagerProtocol?
    let networkManager: NetworkManagerProtocol?
    
    required init(view: LaunchScreenViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, userManager: UserManagerProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        self.userManager = userManager
        fetchCoins()
    }
    
    func fetchCoins() {
        let coins: [String] = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]

        let group = DispatchGroup()
        for coin in coins {
            group.enter()
            self.view?.updataViewData(.loading)
            networkManager?.getCoins(coin: coin, complition: { _ in
                group.leave()
            })
        }

        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            print("Done")
            self.view?.updataViewData(.success)
        }
    }

    
    
    func isAuth() {
        
        let firstLaunch = UserDefaults.standard
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            
            if firstLaunch.object(forKey: "isFirstTime") == nil {
                firstLaunch.set("No", forKey: "isFirstTime")
                self.router?.showOnboardingController()
                
            } else {
                if firstLaunch.bool(forKey: "isLogged") == true {
                    self.router?.showTableViewController()
                } else {
                    self.router?.showAuthViewController()
                }
            }
        }
    }
}
