//
//  MarketDataService.swift
//  AstryptoMobile
//
//  Created by sstonn on 28/12/24.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel?
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    deinit {
        marketDataSubscription?.cancel()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        marketDataSubscription = NetworkingManager.fetchData(url: url, convertTo: GlobalData.self)
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] globalData in
                self?.marketData = globalData.data
                self?.marketDataSubscription?.cancel()
            }
        
    }
}
