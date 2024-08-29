//
//  EodView.swift
//  StockMarket
//
//  Created by Shiva Kumar on 29/08/24.
//

import SwiftUI

struct EodView: View {
    let open:Decimal
    let high:Decimal
    let low:Decimal
    let close:Decimal
    let date:String
    
    init(eod: Eod){
        open = eod.open
        high = eod.high
        low  = eod.low
        close = eod.close
        date = eod.date
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Open : ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("\(open)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("High : ")
                Text("\(high)")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("Low : ")
                Text("\(low)")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("Close :")
                Text("\(close)")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Text("Date : ")
                Text(date.description)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
    }
}

#Preview {
    let eod = Eod(open: 10, high: 11, low: 9, close: 10, date: "")
    return EodView(eod: eod)
}
