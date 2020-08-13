//
//  DataProvider.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import Foundation
import WidgetKit

struct DataProvider: TimelineProvider {
    
    func timeline(with context: Context, completion: @escaping (Timeline<WidgetDataModel>) -> ()) {
        let date = Date()
        let bitcoinDataLoader = BitcoinDataLoader()
        
        bitcoinDataLoader.load { result in
            let bitcoinData: BitcoinData
            if case .success(let fetchedData) = result {
                bitcoinData = fetchedData
                
                let changePercent = bitcoinData.raw.btc.eur.changepct24Hour
                let usdPrice = bitcoinData.raw.btc.usd.price
                let gbpPrice = bitcoinData.raw.btc.gbp.price
                let eurPrice = bitcoinData.raw.btc.eur.price
                
                //MARK:- Initializing data entry
                let data = WidgetDataModel(
                    date: date,
                    changePercent: changePercent,
                    usd: usdPrice,
                    eur: eurPrice,
                    gbp: gbpPrice
                )
                
                let refreshDate = Calendar.current.date(byAdding: .minute, value: 10, to: date)!
                let timeLine = Timeline(entries: [data], policy: .after(refreshDate))
                
                completion(timeLine)
            }
        }//load
    }
    
    func snapshot(with context: Context, completion: @escaping (WidgetDataModel) -> ()) {
        let date = Date()
        
        let data = WidgetDataModel(
            date: date,
            changePercent: 0.0,
            usd: 0.0,
            eur: 0.0,
            gbp: 0.0
        )
        completion(data)
    }
}
