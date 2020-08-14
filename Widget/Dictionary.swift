//
//  Dictionary.swift
//  BitcoinStock
//
//  Created by Emin Bari on 13.08.2020.
//

import Foundation


enum currencyCode: String{
    case USD
    case EUR
    case GBP
}

enum currencySymbols: String, CodingKey {
    case pound = "￡"
    case dollar = "＄"
    case euro = " € "
    case unknown = "N/A"
}

enum scale: Double {
    case large30 = 30
    case large20 = 20
    case large10 = 10
    case medium = 7.5
    case medium5 = 5
    case small = 3.75
    case small3 = 3
    case initial = 1
    case decrease = 0.7
}


