//
//  CoinImageService.swift
//  AstryptoMobile
//
//  Created by sstonn on 9/12/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    var coinSubscription: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(url: urlString)
    }
    
    private func getCoinImage(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        coinSubscription = NetworkingManager.downloadImage(url: url)
            .tryMap { (data) -> UIImage? in
                UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedImage in
                guard let returnedImage else { return }
                self?.image = returnedImage
                self?.coinSubscription?.cancel()
            }
    }
}
