//
//  AllTickerPricesProtocol.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation

protocol AllTickerPricesProtocol {
    
    func fetchAllTickerPrices() async throws -> [String: TickerInfo]
    func parseKrakenPair(_ pair: String) -> (base: String, quote: String)
    
}
