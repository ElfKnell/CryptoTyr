//
//  KrakenTickerResponse.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import Foundation

nonisolated
struct KrakenTickerResponse: Sendable, Codable {
    let error: [String]
    let result: [String: TickerInfo]
}
