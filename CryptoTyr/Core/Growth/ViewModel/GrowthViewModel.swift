//
//  GrowthViewModel.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation
import Combine

final class GrowthViewModel: ObservableObject {
    
    @Published var topCoins: [CoinGrowth] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var isError = false
    
    let OHLCService: OHLCService
    
    init(OHLCService: OHLCService) {
        self.OHLCService = OHLCService
    }
    
    @MainActor
    func load() async {
        
        isLoading = true
        errorMessage = nil
        isError = false
        defer { isLoading = false }
        
        do {
            
            let topCoins = try await OHLCService.top10GrowingCoins()
            let topCoinsSorted = Array(topCoins.prefix(20))
            let last20Slice = Array(topCoins.suffix(20))
            self.topCoins = topCoinsSorted
            self.topCoins.append(contentsOf: last20Slice)
            
            
        } catch {
            errorMessage = error.localizedDescription
            print(error.localizedDescription)
            isError = true
        }

    }
    
}
