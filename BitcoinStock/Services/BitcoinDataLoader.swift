//
//  BitcoinStockLoader.swift
//  BitcoinStock
//
//  Created by Emin Bari on 12.08.2020.
//

import Foundation

class BitcoinDataLoader {
    
    private let baseURL = "https://min-api.cryptocompare.com/data/pricemultifull"
    private let BTC = "BTC"
    private let selectedCurrencies  = "\(currencyCode.EUR.rawValue),\(currencyCode.GBP.rawValue),\(currencyCode.USD.rawValue)"
    
    private var requestURL: String {
        get {
            return baseURL + "?fsyms=" + BTC + "&tsyms=" + selectedCurrencies
        }
    }
    
    func load(complited: @escaping (Result<BitcoinData, Error>) -> Void) {
        guard let url = URL(string: requestURL) else {
            return assertionFailure("Url is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            if error == nil {
                DispatchQueue.main.sync() {
                    let loadedCryptoData = try? JSONDecoder().decode(BitcoinData.self, from: data!)
                    complited(.success(loadedCryptoData!))
                }
            }
        }.resume()
    }
    
}
