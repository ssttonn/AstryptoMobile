//
//  CoinImageViewModel.swift
//  AstryptoMobile
//
//  Created by sstonn on 9/12/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    
    private let imageService: CoinImageService
    
    init(urlString: String) {
        imageService = CoinImageService(
            urlString: urlString
        )
        addSubscribers()
        isLoading = true
    }
    
    private func addSubscribers() {
        imageService.$image.sink{ [weak self] _ in
            self?.isLoading = false
        } receiveValue: { [weak self] returnedImage in
            self?.image = returnedImage
        }.store(in: &cancellables)
    }
}
