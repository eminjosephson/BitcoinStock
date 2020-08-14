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
    
    private let count = WidgetDataModel.dynamics.count
    private var dynamicsImage: String {
        get {
            print("count = ",count)
            if !WidgetDataModel.dynamics.isEmpty && count >= 2 {
                let penultimateElement = WidgetDataModel.dynamics[count - 2]
                print("last element is \(String(WidgetDataModel.dynamics.last!))")
                print("penultimate element is \(penultimateElement)")
                let distinction = WidgetDataModel.dynamics.last! - penultimateElement
                if distinction > 0 {
                    return sfImage.up.rawValue
                } else {
                    return sfImage.down.rawValue
                }
            }
            return "bitcoinsign.circle.fill"
        }
    }
    
    //MARK:- UI properties
    private let horizontalPadding: CGFloat = 0.0
    private let bottomPadding: CGFloat = 0.0
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
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}
