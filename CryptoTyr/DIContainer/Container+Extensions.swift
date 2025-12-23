//
//  Container+Extensions.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation
import Factory

extension Container {
    
    @MainActor
    var AllTicker: Factory<any AllTickerPricesProtocol> {
        self {
            AllTickerPrices()
        }.singleton
    }
    
}
