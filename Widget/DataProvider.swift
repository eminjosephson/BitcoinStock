//
//  DataProvider.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import Foundation
import WidgetKit
import SwiftUI

struct DataProvider: TimelineProvider {
    
    private func appendDynamics(_ changePercent: Double) {
        let maxElementsCount = 22
        
        if WidgetDataModel.dynamics.count < maxElementsCount {
            if (WidgetDataModel.dynamics.last != changePercent) {
                WidgetDataModel.dynamics.append(changePercent)
                print(changePercent)
                print(WidgetDataModel.dynamics)
            }
        } else {
            if WidgetDataModel.dynamics.last != changePercent {
                WidgetDataModel.dynamics.remove(at: 0)
                WidgetDataModel.dynamics.append(changePercent)
                print( WidgetDataModel.dynamics)
            }
            print(WidgetDataModel.dynamics)
        }
    }
    
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
                
                appendDynamics(changePercent)
                
                //MARK:- Initializing data entry
                let data = WidgetDataModel(
                    date: date,
                    changePercent: changePercent,
                    usd: usdPrice,
                    eur: eurPrice,
                    gbp: gbpPrice
                )
                
                //MARK:- Widget timeline updating
                let updateValue: Int = 1
                let timePeriod = Calendar.Component.minute
                let refreshDate = Calendar.current.date(byAdding: timePeriod, value: updateValue, to: date)!
                let timeLine = Timeline(entries: [data], policy: .after(refreshDate))
                
                completion(timeLine)
            }
        }//load
    }
    
    //MARK:- Fake widget data for overview in widget panel
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
