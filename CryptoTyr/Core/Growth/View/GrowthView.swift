//
//  GrowthView.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import SwiftUI

struct GrowthView: View {
    
    @StateObject var viewModel = GrowthViewModel(OHLCService: OHLCService())
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.topCoins) { coin in
                
                HStack {
                    Text("\(coin.base)/\(coin.quote)")
                    Spacer()
                    Text(String(format: "\(coin.change < 0 ? "" : "+")%.2f%%", coin.change))
                        .foregroundStyle(.green)
                }
            }
            .navigationTitle("Top Gainers 24h")
            .overlay{
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .task {
                await viewModel.load()
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
    GrowthView()
}
