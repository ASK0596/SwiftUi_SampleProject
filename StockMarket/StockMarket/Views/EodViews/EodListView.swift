//
//  EodListView.swift
//  StockMarket
//
//  Created by Shiva Kumar on 29/08/24.
//

import SwiftUI

struct EodListView: View {
    @State private var model = EodViewModel()
    @State var dataLoaded = false
    var symbol = ""
    
    init(symbol: String) {
        self.symbol = symbol
    }
    
    var body: some View {
        List(model.eods) {eod in
            EodView(eod: eod)
        }
        .listStyle(.plain)
        .navigationTitle("\(self.symbol) Data")
        .task {
            if dataLoaded {return}
            try? await model.fetchTickerEods(symbol: symbol)
            dataLoaded = true
        }
    }
}

#Preview {
    EodListView(symbol: "AAPL")
}
