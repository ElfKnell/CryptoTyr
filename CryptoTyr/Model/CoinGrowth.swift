//
//  CoinGrowth.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation

struct CoinGrowth: Identifiable {
    let id = UUID()
    let pair: String
    let base: String
    let quote: String
    let change: Double
}
