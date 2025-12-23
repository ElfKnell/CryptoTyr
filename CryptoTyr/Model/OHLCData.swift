//
//  OHLCData.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 14/12/2025.
//

import Foundation

struct OHLCData: Codable {
    
    let time: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volumeWeightedAveragePrice: Double
    let volume: Double
    let count: Int

    // Custom initializer to map array indices to named properties
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        // Kraken OHLC data is an array in this order:
        // [time, open, high, low, close, vwap, volume, count]
        
        // 0: Time (Unix timestamp)
        let timeInSeconds = try container.decode(Double.self)
        self.time = Date(timeIntervalSince1970: timeInSeconds)
        
        // 1-7: The rest are strings representing numbers in the JSON
        self.open = try Double(container.decode(String.self)) ?? 0.0
        self.high = try Double(container.decode(String.self)) ?? 0.0
        self.low = try Double(container.decode(String.self)) ?? 0.0
        self.close = try Double(container.decode(String.self)) ?? 0.0
        self.volumeWeightedAveragePrice = try Double(container.decode(String.self)) ?? 0.0
        self.volume = try Double(container.decode(String.self)) ?? 0.0
        self.count = try container.decode(Int.self)
    }

    func encode(to encoder: Encoder) throws {
        // Encoding is generally not needed for API response structs, but required by Codable
        // This is a minimal implementation for completeness.
        var container = encoder.unkeyedContainer()
        try container.encode(time.timeIntervalSince1970)
        try container.encode(String(open))
        try container.encode(String(high))
        try container.encode(String(low))
        try container.encode(String(close))
        try container.encode(String(volumeWeightedAveragePrice))
        try container.encode(String(volume))
        try container.encode(count)
    }
    
}
