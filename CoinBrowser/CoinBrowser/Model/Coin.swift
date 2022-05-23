//
//  Coin.swift
//  CoinBrowser
//
//  Created by Scott Cox on 5/23/22.
//

import Foundation

class Coin {
    var id: String
    var symbol: String
    var name: String
    
    init(id: String, symbol: String, name: String) {
        self.id = id
        self.symbol = symbol
        self.name = name
    }
} // End of class
