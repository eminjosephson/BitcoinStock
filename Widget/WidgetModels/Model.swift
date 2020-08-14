//
//  Model.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import Foundation
import WidgetKit
import SwiftUI

struct WidgetDataModel: TimelineEntry {
    let date: Date
    let changePercent: Double
    let usd: Double
    let eur: Double
    let gbp: Double
    
    //Fake initial dynamics data
    static var dynamics: [Double] = [0.7, 0.9, 1.4, 1.1, 0.7, 0.6, 0.4, 0.2, -0.1, -0.5, -0.8, -0.9,-0.7,-0.8, -0.5, -0.4, -0.1, 0.2, 0.5, 0.7, 0.9, 1.2, 1.6]
}
