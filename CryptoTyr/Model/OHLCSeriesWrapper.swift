//
//  OHLCSeriesWrapper.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 14/12/2025.
//

import Foundation

struct OHLCSeriesWrapper: Codable {
    
    let data: [OHLCData]
    let last: Int

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKey.self)
        
        // Find the key that holds the OHLC array (e.g., "XXBTZUSD").
        // This key will be the one that is NOT "last".
        guard let dataKey = container.allKeys.first(where: { $0.stringValue != "last" }) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not find the OHLC data key."))
        }
        
        // Decode the data array using the dynamic key
        self.data = try container.decode([OHLCData].self, forKey: dataKey)
        
        // Decode the 'last' integer
        self.last = try container.decode(Int.self, forKey: DynamicCodingKey(stringValue: "last")!)
    }
    
    // Helper struct for decoding dynamic keys (like "XXBTZUSD")
    private struct DynamicCodingKey: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) { self.stringValue = stringValue }
        init?(intValue: Int) { self.stringValue = String(intValue); self.intValue = intValue }
    }
    
}
