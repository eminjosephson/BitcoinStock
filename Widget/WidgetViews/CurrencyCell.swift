//
//  CurrencyCell.swift
//  BitcoinStock
//
//  Created by Emin Bari on 13.08.2020.
//

import SwiftUI

struct CurrencyCell: View {
    let currencyValue: Double
    let currencyName: String
    
    private var currencySymbol: String {
        get {
            switch currencyName {
                case currencyCode.GBP.rawValue:
                    return currencySymbols.pound.rawValue
                case currencyCode.EUR.rawValue:
                    return currencySymbols.euro.rawValue
                case currencyCode.USD.rawValue:
                    return currencySymbols.dollar.rawValue
                default:
                    return currencySymbols.unknown.rawValue
            }
        }
    }
    
    let textWidth: CGFloat  = 40.0
    let textPadding: CGFloat = 1.0
    
    var body: some View {
        
        HStack {
            Text(currencyName)
                .foregroundColor(.white)
                .bold()
                .frame(width: textWidth)
                .padding(.trailing, textPadding)
            Spacer()
            Text("\(String(format: "%.2f", currencyValue))" + currencySymbol)
                .foregroundColor(.orange)
        }
    }
}
