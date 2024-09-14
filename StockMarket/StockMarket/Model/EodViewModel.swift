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
    var errorMSG:String = ""
    var showAlert = false
    
    func fetchTickerEods(symbol:String) async throws{
        let urlString = baseURL + version + "eod"
        guard var urlComponents = URLComponents(string: urlString) else{
            errorMSG = "Invalid EOD URL"
            showAlert = true
            return
        }
        
        let urlQAccess = URLQueryItem(name: "access_key", value: access_key)
        let urlSymbol  = URLQueryItem(name: "symbols", value: symbol)
        
        urlComponents.queryItems = [urlQAccess, urlSymbol]
        guard let url = urlComponents.url else{
            errorMSG = "Invalid Components URL"
            showAlert = true
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                self.errorMSG = ("Error while fetching EOD data, Error : \(error.localizedDescription)")
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
