//
//  DynamicsChart.swift
//  BitcoinStock
//
//  Created by Emin Bari on 14.08.2020.
//

import SwiftUI

struct DynamicsChart: View {
    private var plotScale: scale {
        get {
            guard let max = DataProvider.Entry.dynamics.max() else {return .initial}
            
            switch max {
            case -1...1:
                print("scale 30")
                return .large30
            case -2...2:
                print("scale 20")
                return .large20
            case -3...3:
                print("scale 10")
                return .large10
            case -4...4:
                print("scale 7.5")
                return .medium
            case -6...6:
                print("scale 5")
                return .medium5
            case -8...8:
                print("scale 3.75")
                return .small
            case -10...10:
                print("scale 3")
                return .small3
            case -15...15:
                print("scale 1")
                return .initial
            default:
                if (max > 15 && max < -15) {
                    print("scale 0.7")
                    return .decrease
                }
            }
            return .decrease
        }
    }
    
    let chartHeight: CGFloat = 60.0
    let bottomPadding: CGFloat = 10.0
    let horizontalPadding: CGFloat = 4.0
    let verticalSpacing: CGFloat = 0.0
    
    var body: some View {
        HStack {
            VStack(alignment: HorizontalAlignment.leading, spacing: verticalSpacing) {
                BarLine(
                    barScale: plotScale.rawValue,
                    cryptoDynamicsData: DataProvider.Entry.dynamics,
                    barColor: .green,
                    alignment: .bottom) { (element: Double) -> Bool in
                    element > 0
                }
                BarLine(
                    barScale: plotScale.rawValue,
                    cryptoDynamicsData: DataProvider.Entry.dynamics,
                    barColor: .red,
                    alignment: .top) { (element: Double) -> Bool in
                    element < 0
                }
            }//VStack
            Spacer()
        }
        .frame(height: chartHeight)
        .padding(.bottom, bottomPadding)
        .padding(.horizontal, horizontalPadding)
        //HStack
    }//View
}
