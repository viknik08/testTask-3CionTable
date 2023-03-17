//
//  DetailPresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setCoin(coin: Coin?)
    
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, coin: Coin?)
    var coin: Coin? { get set }
    func getCoin()
    func popToRoot()
}

class DetailPresenter: DetailPresenterProtocol {
 
    weak var view: DetailViewProtocol?
    let networkManager: NetworkManagerProtocol?
    var coin: Coin?
    var router: RouterProtocol?
    
    required init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol, coin: Coin?) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        self.coin = coin
    }
    
    func getCoin() {
        self.view?.setCoin(coin: coin)
    }
    
    func popToRoot() {
        router?.popToRoot()
    }

}
