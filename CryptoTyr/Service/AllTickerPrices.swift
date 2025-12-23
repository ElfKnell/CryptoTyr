//
//  AllTickerPrices.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import Foundation
import Alamofire

class AllTickerPrices: AllTickerPricesProtocol {
    
    func fetchAllTickerPrices() async throws -> [String: TickerInfo] {
        
        let url = "https://api.kraken.com/0/public/Ticker"
            
        let value = try await AF.request(url)
            .serializingDecodable(KrakenTickerResponse.self)
            .value
        
        guard value.error.isEmpty else {
            throw NSError(
                domain: "KrakenAPI",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: value.error.joined(separator: ", ")]
            )
        }
        
        return value.result
    }
    
    func parseKrakenPair(_ pair: String) -> (base: String, quote: String) {
        
        let cleaned = pair.replacingOccurrences(of: "^X|Z", with: "", options: .regularExpression)
        
        if cleaned.count < 4 {
            return (cleaned, "")
        }
        
        if cleaned.hasSuffix("USDT") || cleaned.hasSuffix("USDC") {
            let base = String(cleaned.prefix(cleaned.count - 4))
            let quote = String(cleaned.suffix(4))
            return (base, quote)
        } else {
            let base = String(cleaned.prefix(cleaned.count - 3))
            let quote = String(cleaned.suffix(3))
            return (base, quote)
        }
        
    }
}
