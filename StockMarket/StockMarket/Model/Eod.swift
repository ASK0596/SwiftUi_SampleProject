//
//  EOD.swift
//  StockMarket
//
//  Created by Shiva Kumar on 28/08/24.
//

import Foundation

struct Eod: Codable, Identifiable{
    
    var id = UUID()
    
    var open:Decimal
    var high:Decimal
    var low:Decimal
    var close:Decimal
    var date:String
    
    enum CodingKeys: String, CodingKey {
        case open, high, low, close, date
    }
}

struct Eods: Codable{
    var data: [Eod]
}
