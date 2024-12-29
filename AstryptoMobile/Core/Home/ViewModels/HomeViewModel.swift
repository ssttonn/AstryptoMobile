//
//  HomeViewModel.swift
//  AstryptoMobile
//
//  Created by sstonn on 14/11/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -1),
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var porfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    private var cancellables: Set<AnyCancellable> = []
    
    private let coinDataService = CoinDataServices()
    private let marketDataService = MarketDataService()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        coinDataService.$allCoins.sink{ [weak self] returnedCoins in
            self?.allCoins = returnedCoins
        }
        .store(in: &cancellables)
        
        $searchText.combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main).map { (searchText, allCoins) -> [CoinModel] in
            guard !searchText.isEmpty else {
                return allCoins
            }
            
            let lowercasedSearchText = searchText.lowercased()
            
            return allCoins.filter { coin in
                return coin.name.lowercased().contains(lowercasedSearchText) ||
                coin.symbol.lowercased().contains(lowercasedSearchText) ||
                coin.id.lowercased().contains(lowercasedSearchText)
            }
        }.sink { [weak self] filteredCoins in
            self?.allCoins = filteredCoins
        }.store(in: &cancellables)
        
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] statistics in
                guard let self else {
                    return
                }
                
                self.statistics = statistics
            }
            .store(in: &cancellables)
    }
    
    private func mapGlobalMarketData(marketData: MarketDataModel?) -> [StatisticModel] {
        guard let marketData else {
            return []
        }
        
        var stats: [StatisticModel] = []
        
        let marketCap = StatisticModel(title: "Market Cap", value: marketData.marketCap, percentageChange: marketData.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24H Volume", value: marketData.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: marketData.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        
        return stats
    }
}
