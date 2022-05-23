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
        
        URLSession.shared.dataTask(with: finalURL) { coinData, _, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
                completion(false)
            }
            guard let data = coinData else {
                completion(false)
                return
            }

            do {
                if let topLevelArrayOfCoinDictionaries = try JSONSerialization.jsonObject(with: data) as? [[String:String]] {
                    for coinDictionary in topLevelArrayOfCoinDictionaries {
                        if let id = coinDictionary["id"], let symbol = coinDictionary["symbol"], let name = coinDictionary["name"] {
                            let parcedCoin = Coin(id: id, symbol: symbol, name: name)
                            coins.append(parcedCoin)
                        }
                    }
                }
                completion(true)
            } catch {
                print("Error in Do/Try/Catch: \(error.localizedDescription)")
                completion(false)
            }
        }.resume()
    }
    
    
    
    
    
    
} // End of class

