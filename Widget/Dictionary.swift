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


