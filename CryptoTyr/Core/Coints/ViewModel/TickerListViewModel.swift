//
//  TickerListViewModel.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import Foundation
import Combine
import Factory

@MainActor
final class TickerListViewModel: ObservableObject {
    
    @Injected(\.AllTicker) var service
    
    @Published var tickers: [TickerDisplay] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var isError = false
    
    func fetchTickers() async {
        isLoading = true
        errorMessage = nil
        isError = false

        do {
            let result = try await service.fetchAllTickerPrices()
            
            self.tickers = result.map { pair, info in
                let parsedPair = service.parseKrakenPair(pair)
                let price = info.lastPrice.first ?? "-"
                return TickerDisplay(pairbBase: parsedPair.base, pairbQuote: parsedPair.quote, lastPrice: price)
            }
            .sorted { $0.pairbBase < $1.pairbBase }

        } catch {
            errorMessage = error.localizedDescription
            isError = true
        }

        isLoading = false
    }
}
