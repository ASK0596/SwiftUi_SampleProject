//
//  ContentView.swift
//  StockMarket
//
//  Created by Shiva Kumar on 28/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var model = TickerViewModel()
    @State var dataLoaded = false
    
    var body: some View {
        NavigationSplitView{
            List(model.tickers) {ticker in
                NavigationLink{
                    EodListView(symbol: ticker.symbol)
                } label: {
                    TickerView(ticker: ticker)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Tickers")
            .task {
                if dataLoaded {return}
                try? await model.fetchTickers()
                dataLoaded = true
            }
            .alert(model.errorMSG, isPresented: $model.showAlert) {
                Button("OK"){
                    print("OK")
                }
            }
        } detail: {
            Text("Select a Ticker")
        }
    }
}

#Preview {
    ContentView()
}
