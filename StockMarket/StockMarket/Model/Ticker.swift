//
//  Ticker.swift
//  StockMarket
//
//  Created by Shiva Kumar on 28/08/24.
//

import Foundation

struct Ticker: Codable, Identifiable{
    
    let id = UUID()
    
    var name: String
    var symbol: String
    var stock_exchange: StockExchange
    
    enum CodingKeys: String, CodingKey {
        case name, symbol, stock_exchange
    }
}

struct StockExchange: Codable{
    var name: String
    var acronym: String
    var country: String
}

struct Tickers: Codable{
    var data: [Ticker]
}
