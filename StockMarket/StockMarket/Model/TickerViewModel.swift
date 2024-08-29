//
//  TickerViewModel.swift
//  StockMarket
//
//  Created by Shiva Kumar on 29/08/24.
//

import Foundation

@Observable
class TickerViewModel : ViewModel{
    var tickers: [Ticker] = []
    
    func fetchTickers() async throws{
        let urlString = baseURL + version + "tickers"
        guard var urlComponents = URLComponents(string: urlString) else{
            print("Invalid Tickers URL")
            return
        }
        
        urlComponents.queryItems = [URLQueryItem(name: "access_key", value: access_key)]
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
                if let jsonTickers = try? decoder.decode(Tickers.self, from: data){
                    DispatchQueue.main.async {
                        self.tickers = jsonTickers.data
                    }
                }
            }
        }
        task.resume()
    }
}
