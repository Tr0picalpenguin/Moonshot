//
//  CoinController.swift
//  CoinBrowser
//
//  Created by Scott Cox on 5/23/22.
//

import Foundation

class CoinController {
    
    // MARK: - Singleton
    static let sharedInstance = CoinController()
    
    // MARK: - Properties
    var coins: [Coin] = []
    
    private static let baseURLString = "https://api.coingecko.com/api/v3"
    private static let keyCoinsComponent = "coins"
    private static let keyListComponent = "list"
    
    // MARK: - CRUD functions
    
    
    static func fetchCoins(completion: @escaping (Bool) -> Void) {
        guard let baseURL = URL(string: baseURLString) else {
            return completion(false)
        }
        let coinsURL = baseURL.appendingPathComponent(keyCoinsComponent)
        let finalURL = coinsURL.appendingPathComponent(keyListComponent)
        print(finalURL)
    }
    
    
    
    
    
} // End of class

