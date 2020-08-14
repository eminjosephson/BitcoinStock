//
//  BarLine.swift
//  BitcoinStock
//
//  Created by Emin Bari on 14.08.2020.
//

import SwiftUI

struct BarLine: View {
    
    let barScale: Double
    let cryptoDynamicsData: [Double]
    let barColor: Color
    let alignment: VerticalAlignment
    let condition: (Double) -> Bool
    
    let indicatorBarWidth: CGFloat = 3.0
    let barWidth: CGFloat = 5.0
    let barCornerRadius: CGFloat = 1.5
    let spacing: CGFloat = 1.0
    let opacityValue: Double = 0.9
    let zeroHeight: CGFloat = 0.0
    
    var body: some View {
        
        HStack(alignment: alignment, spacing: spacing) {
            
            //MARK:- indicator bar
            Rectangle()
                .fill(barColor.opacity(opacityValue))
                .frame(width: indicatorBarWidth)
                .cornerRadius(barCornerRadius)
            
            Rectangle()
                .frame(width: indicatorBarWidth, height: zeroHeight)
            
            ForEach(cryptoDynamicsData, id: \.self) { element in
                if (condition(element)) {
                    VStack (spacing: 0.5) {
                        
                        if element > 0 {
                            Rectangle()
                                .fill(Color.blue.opacity(opacityValue))
                                .frame(width: 4, height: 3)
                                .cornerRadius(barCornerRadius)
                        }
                        
                        Rectangle()
                            .fill(Color.black.opacity(opacityValue))
                            .frame(width: barWidth, height: CGFloat(abs(element)) * CGFloat(barScale))
                            .cornerRadius(barCornerRadius)
                        
                        if element < 0 {
                            Rectangle()
                                .fill(Color.blue.opacity(opacityValue))
                                .frame(width: 4, height: 3)
                                .cornerRadius(barCornerRadius)
                        }
                            
                    }//VStack
                } else {
                    //MARK:- Emty space bar
                    Rectangle()
                        .fill(Color.black.opacity(opacityValue))
                        .frame(width: barWidth, height: zeroHeight)
                }
            }
        }//Raisin
    }
}
