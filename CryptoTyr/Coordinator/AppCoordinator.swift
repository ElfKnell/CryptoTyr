//
//  AppCoordinator.swift
//  CryptoTyr
//
//  Created by Andrii Kyrychenko on 13/12/2025.
//

import Foundation
import Combine

final class AppCoordinator: ObservableObject {
    
    @Published var selectedScreen: AppScreen = .allTickers
        
    func navigateToGainers() {
        selectedScreen = .topGainers
    }
    
    func navigateToTickers() {
        selectedScreen = .allTickers
    }
    
}
