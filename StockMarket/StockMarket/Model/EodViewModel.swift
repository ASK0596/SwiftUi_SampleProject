//
//  EodViewModel.swift
//  StockMarket
//
//  Created by Shiva Kumar on 29/08/24.
//

import Foundation

@Observable
class EodViewModel: ViewModel{
    
    var eods: [Eod] = []
    func fetchTickerEods(symbol:String) async throws{
        let urlString = baseURL + version + "eod"
        guard var urlComponents = URLComponents(string: urlString) else{
            print("Invalid Tickers URL")
            return
        }
        
        let urlQAccess = URLQueryItem(name: "access_key", value: access_key)
        let urlSymbol  = URLQueryItem(name: "symbols", value: symbol)
        
        urlComponents.queryItems = [urlQAccess, urlSymbol]
        guard let url = urlComponents.url else{
            print("Invalid Compoments URl")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error while fetching Tickers, Error : \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Response error")
                return
            }
            if let data = data{
                let decoder = JSONDecoder()
                if let jsonTickers = try? decoder.decode(Eods.self, from: data){
                    DispatchQueue.main.async {
                        self.eods = jsonTickers.data
                    }
                }
            }
        }
        task.resume()
    }
}
