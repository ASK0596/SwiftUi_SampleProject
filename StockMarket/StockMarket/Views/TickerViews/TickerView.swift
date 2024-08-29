//
//  TickerView.swift
//  StockMarket
//
//  Created by Shiva Kumar on 28/08/24.
//

import SwiftUI

struct TickerView: View {
    let name: String
    let symbol: String
    let stockName: String
    let stockAcronmy: String
    let stockCountry: String
    
    init(ticker: Ticker) {
        name = ticker.name
        symbol = ticker.symbol
        stockName = ticker.stock_exchange.name
        stockAcronmy = ticker.stock_exchange.acronym
        stockCountry = ticker.stock_exchange.country
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text(symbol)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("Exchange: ")
                Text(stockName)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("Exchange Acronmy: ")
                Text(stockAcronmy)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("Exchange Country :")
                Text(stockCountry)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
    }
    
}

#Preview {
    let stkExchange = StockExchange(name: "StkName", acronym: "StkAcr", country: "StkCountry")
    let tickerTxt = Ticker(name: "TestName", symbol: "TestSymbol", stock_exchange: stkExchange)
    return TickerView(ticker: tickerTxt)
}

