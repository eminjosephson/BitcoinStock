//
//  Model.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import Foundation
import WidgetKit

struct WidgetDataModel: TimelineEntry {
    let date: Date
    let changePercent: Double
    let usd: Double
    let eur: Double
    let gbp: Double
}
