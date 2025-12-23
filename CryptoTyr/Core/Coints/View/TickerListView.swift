//
//  TickerListView.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import SwiftUI

struct TickerListView: View {
    
    @StateObject private var viewModel = TickerListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.tickers) { ticker in
                HStack {
                    Text(ticker.pairbBase)
                        .font(.headline)
                        .padding(.horizontal)
                    Text(ticker.pairbQuote)
                        .font(.headline)
                        .padding(.horizontal)
                    Spacer()
                    Text(ticker.lastPrice)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Kraken Tickers")
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .task {
                await viewModel.fetchTickers()
            }
            .alert("Error", isPresented: $viewModel.isError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
}

#Preview {
    TickerListView()
}
