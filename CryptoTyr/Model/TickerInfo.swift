//
//  TickerInfo.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import Foundation

struct TickerInfo: Sendable, Codable {
    let ask: [String]
    let bid: [String]
    let lastPrice: [String]
    let openPrice: String
    let volume: [String]
    let lowPrice: [String]
    
    private enum CodingKeys: String, CodingKey {
        case ask = "a"
        case bid = "b"
        case lastPrice = "c"
        case openPrice = "o"
        case volume = "v"
        case lowPrice = "l"
    }
}

