//
//  MainTablePresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import Foundation

protocol MainTableViewProtocol: AnyObject {
    func reloadTableView()
    func failure(error: Error)
}

protocol MainTablePresenterProtocol: AnyObject {
    init(view: MainTableViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
    func showDetail(coin: Coin?)
    func showProfile()
    func logOut()
    func getCoins()
    func refreshTableView()
    var coins: [Coin]? { get set }
}

class MainTablePresenter: MainTablePresenterProtocol {

    weak var view: MainTableViewProtocol?
    let networkManager: NetworkManagerProtocol?
    var router: RouterProtocol?
    var coins: [Coin]?
    
    required init(view: MainTableViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        getCoins()
    }
    
    func refreshTableView() {
        DispatchQueue.main.async {
            self.view?.reloadTableView()
        }
    }
    
    func getCoins() {
        DispatchQueue.main.async {
            self.coins = NetworkManager.coins
            self.view?.reloadTableView()
        }
    }
    
    func showDetail(coin: Coin?) {
        router?.showDetailController(coin: coin)
    }
    
    func showProfile() {
        router?.showUserProfileController()
    }
    
    func logOut() {
        UserDefaults.standard.set(false, forKey: "isLogged")
        router?.showAuthViewController()
    }
    
}
