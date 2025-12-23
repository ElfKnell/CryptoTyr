//
//  OHLCResponse.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation

nonisolated
struct OHLCResponse: Sendable, Codable {
    
    let error: [String]
    let result: OHLCSeriesWrapper
    
}
