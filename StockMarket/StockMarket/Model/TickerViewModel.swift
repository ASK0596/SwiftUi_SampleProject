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
    var errorMSG:String = ""
    var showAlert = false
    
    func fetchTickers() async throws{
        let urlString = baseURL + version + "tickers"
        guard var urlComponents = URLComponents(string: urlString) else{
            errorMSG = "Invalid Tickers URL"
            showAlert = true
            return
        }
        
        urlComponents.queryItems = [URLQueryItem(name: "access_key", value: access_key)]
        guard let url = urlComponents.url else{
            errorMSG = "Invalid Compoments URL"
            showAlert = true
            return
        }
                
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                self.errorMSG = ("Error while fetching Tickers, Error : \(error.localizedDescription)")
                self.showAlert = true
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.errorMSG = "Response error"
                self.showAlert = true
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
