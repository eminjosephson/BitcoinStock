//
//  MainWidgetView.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import SwiftUI

struct MainWidgetView: View {
    var data: DataProvider.Entry
    
    
    
    var body: some View {
        ZStack {
            
            //MARK: - Rectangle with gradient as gradient background of view
            Rectangle().fill(Color.black)
            VStack {
                
                HeaderView(changePercentValue: data.changePercent)
                
                VStack(alignment: .leading) {
                    Spacer()
                    CurrencyCell(
                        currencyValue: data.usd,
                        currencyName: currencyCode.USD.rawValue)
                    Spacer()
                    CurrencyCell(
                        currencyValue: data.eur,
                        currencyName: currencyCode.EUR.rawValue)
                    Spacer()
                    CurrencyCell(
                        currencyValue: data.gbp,
                        currencyName: currencyCode.GBP.rawValue)
                    Spacer()
                }
                .padding(2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(14.0)
                
            }.padding(8.0)//VStack
            
        }//ZStack
    }
}
