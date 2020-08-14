//
//  MainWidgetView.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import SwiftUI

struct MainWidgetView: View {
    var data: DataProvider.Entry
    
    let fillColor: Color = Color.orange
    let cornerRadius: CGFloat = 14.0

    let backgroundColor: Color = Color.white.opacity(0.2)
    let smallPadding: CGFloat = 2.0
    let mediumPadding: CGFloat = 8.0
    
    let colors = Gradient(colors: [.orange, .orange, Color.orange.opacity(0.8)])
    var MainRectangleGradient: LinearGradient {
        return LinearGradient(
            gradient: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    let innerColors = Gradient(colors: [Color.white.opacity(0.15), .orange, .orange])
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
                VStack {
                    Spacer()
                    CurrencyCell(
                        currencyValue: data.usd,
                        currencyName: currencyCode.USD.rawValue)
                    Spacer()
                    DynamicsChart()
                }
                .padding(smallPadding)
                .background(innerRectangleGradient)
                .cornerRadius(cornerRadius)
            }.padding(mediumPadding)//VStack
        }//ZStack
    }
}
