//
//  ContentView.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 12/12/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = AppCoordinator()
    
    var body: some View {
        
        TabView(selection: $viewModel.selectedScreen) {
            
            NavigationStack {
                TickerListView()
            }
            .tag(AppScreen.allTickers)
            .tabItem {
                Label("Усі Тікери", systemImage: "list.bullet.rectangle.fill")
            }
            
            NavigationStack {
                GrowthView()
            }
            .tag(AppScreen.topGainers)
            .tabItem {
                Label("Лідер Зростання", systemImage: "chart.line.uptrend.xyaxis")
            }
        }
    }
}

#Preview {
    ContentView()
}
