//
//  NetworkManager.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func getCoins(coin: String, complition: @escaping (Result<CoinModel, Error>) -> ())
//    func getCoinMark(complition: @escaping ()->()) 
//    var coins: [Coin] { get set }
}

class NetworkManager: NetworkManagerProtocol {
    
    static var coins = [Coin]()
    
    private func getUrl(coin: String) -> String {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "data.messari.io"
        component.path = "/api/v1/assets/" + coin + "/metrics"
        return component.url?.absoluteString ?? "Error"
    }
    
    func getCoins(coin: String, complition: @escaping (Result<CoinModel, Error>) -> ()) {
        let url = getUrl(coin: coin)
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("x-messari-api-key", forHTTPHeaderField: "07101c86-c534-4d4d-a817-deb5ad7fbd56")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                guard let data = data else { return }
                do {
                    let coinsModel = try JSONDecoder().decode(CoinModel.self, from: data)
//                    self.coins.append(coinsModel.data)
                    NetworkManager.coins.append(coinsModel.data)
                    complition(.success(coinsModel))
                } catch let error {
                    print(error)
                    complition(.failure(error))
                }
            }
        }.resume()
    }
    
    
//    func getCoinMark(complition: @escaping ()->()) {
//        let coins: [String] = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
//
//        let url = "https://data.messari.io/api/v1/assets/polkadot/metrics"
//        guard let url = URL(string: url) else { return }
//                
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("x-messari-api-key", forHTTPHeaderField: "07101c86-c534-4d4d-a817-deb5ad7fbd56")
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
//                guard let data = data else { return }
//                do {
//                    let coinsModel = try JSONDecoder().decode(CoinModel.self, from: data)
//                    self.coins.append(coinsModel.data)
//                    complition()
//                } catch let error {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
}
