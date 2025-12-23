//
//  OHLCService.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation
import Alamofire
import Factory

class OHLCService {
    
    @Injected(\.AllTicker) var allTicker
    
    func top10GrowingCoins() async throws -> [CoinGrowth] {
        
        var growthList: [CoinGrowth] = []
        
        let result = try await allTicker.fetchAllTickerPrices()
        
        for ticker in result {
            
            guard let openPrice = Double(ticker.value.openPrice),
                  let lastPriceString = ticker.value.lastPrice.first,
                  let lastPrice = Double(lastPriceString),
                  openPrice > 0
            else {
                continue
            }
            let change = percentageChange(open: openPrice, close: lastPrice)
            let parsePair = allTicker.parseKrakenPair(ticker.key)
            
            let growthTicker = CoinGrowth(
                pair: ticker.key,
                base: parsePair.base,
                quote: parsePair.quote,
                change: change)
            growthList.append(growthTicker)
        }
        
        return growthList
            .sorted { $0.change > $1.change }
            //.prefix(10)
            //.map { $0 }
        
    }
    
    private func percentageChange(open: Double, close: Double) -> Double {
        return ((close - open) / open) * 100
    }
    
}
