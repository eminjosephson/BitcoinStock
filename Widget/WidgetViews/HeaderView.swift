//
//  HeaderView.swift
//  BitcoinStock
//
//  Created by Emin Bari on 13.08.2020.
//

import SwiftUI

struct HeaderView: View {
    
    let changePercentValue: Double
    
    private enum sfImage: String, CodingKey {
        case up = "arrowtriangle.up.circle.fill"
        case down = "arrowtriangle.down.circle.fill"
    }
    
    private var dynamicsImage: String {
        get {
            if changePercentValue > 0 {
                return sfImage.up.rawValue
            } else{
                return sfImage.down.rawValue
            }
        }
    }
    
    //MARK:- UI properties
    private let horizontalPadding: CGFloat = 5.0
    private let bottomPadding: CGFloat = 5.0
    private let textColor: Color = .white
    
    private let cryptoCurrencyName: String = "BTC"
    
    var body: some View {
        HStack {
            Text(cryptoCurrencyName)
                .foregroundColor(textColor)
                .font(.title2)
                .bold()
            Spacer()
            Image(systemName: dynamicsImage)
                .foregroundColor(textColor)
                .font(.callout)
            Spacer()
            Text("\(String(format:"%.2f", changePercentValue))%")
                .foregroundColor(textColor)
        }
        .padding(.bottom, bottomPadding)
        .padding(.horizontal, horizontalPadding)
    }
}
