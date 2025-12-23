//
//  TickerDisplay.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import Foundation

struct TickerDisplay: Identifiable {
    let id = UUID()
    let pairbBase: String
    let pairbQuote: String
    let lastPrice: String
}
