//
//  HomeViewModel.swift
//  AstryptoMobile
//
//  Created by sstonn on 14/11/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var porfolioCoins: [CoinModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    private let dataService = CoinDataServices()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins.sink{ [weak self] returnedCoins in
            self?.allCoins = returnedCoins
        }
        .store(in: &cancellables)
    }
}
