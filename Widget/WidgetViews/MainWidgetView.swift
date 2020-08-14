//
//  MainWidgetView.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import SwiftUI

struct MainWidgetView: View {
    var data: DataProvider.Entry
    
//    let fillColor: Color = Color.orange
    let cornerRadius: CGFloat = 14.0

    let backgroundColor: Color = Color.white.opacity(0.2)
    let smallPadding: CGFloat = 2.0
    let mediumPadding: CGFloat = 10.0
    
    let colors = Gradient(colors: [.black])
    var MainRectangleGradient: LinearGradient {
        return LinearGradient(
            gradient: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    let innerColors = Gradient(colors: [Color.white.opacity(0.1)])
    var innerRectangleGradient: LinearGradient {
        return LinearGradient(
            gradient: innerColors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var body: some View {
        ZStack {
            Rectangle().fill(MainRectangleGradient)
            VStack {
                HeaderView(changePercentValue: data.changePercent)
                Spacer()
                DynamicsChart()
                Spacer()
                CurrencyCell(
                    currencyValue: data.usd,
                    currencyName: currencyCode.USD.rawValue)
                
            }//VStack
        }//ZStack
    }
}
