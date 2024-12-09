//
//  Untitled.swift
//  AstryptoMobile
//
//  Created by sstonn on 8/12/24.
//

import Foundation
import Combine

class CoinDataServices {
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
        coinSubscription = NetworkingManager.fetchData(url: url)
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            }
        
    }
}
