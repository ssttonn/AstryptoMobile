//
//  HomeViewModel.swift
//  AstryptoMobile
//
//  Created by sstonn on 14/11/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var porfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self else { return }
            allCoins.append(DeveloperPreview.instance.coin)
            porfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
