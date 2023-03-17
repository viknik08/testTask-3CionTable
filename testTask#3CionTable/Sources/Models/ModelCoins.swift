//
//  ModelCoins.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import Foundation


struct CoinModel: Codable {
    let data: Coin
}

struct Coin: Codable {
    let name: String
    let symbol: String
    
    var marketData: MarketData

    enum CodingKeys: String, CodingKey {
        case symbol, name
        case marketData = "market_data"
    }
}

struct MarketData: Codable {
    var priceUsd: Double?
    var priceBtc: Double?
    var priceEth: Double?
    var percentChangeUsdLast1_Hour, percentChangeBtcLast1_Hour, percentChangeEthLast1_Hour: Double?
    var percentChangeUsdLast24_Hours, percentChangeBtcLast24_Hours, percentChangeEthLast24_Hours: Double?
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case priceEth = "price_eth"
        case percentChangeUsdLast1_Hour = "percent_change_usd_last_1_hour"
        case percentChangeBtcLast1_Hour = "percent_change_btc_last_1_hour"
        case percentChangeEthLast1_Hour = "percent_change_eth_last_1_hour"
        case percentChangeUsdLast24_Hours = "percent_change_usd_last_24_hours"
        case percentChangeBtcLast24_Hours = "percent_change_btc_last_24_hours"
        case percentChangeEthLast24_Hours = "percent_change_eth_last_24_hours"
    }
}

