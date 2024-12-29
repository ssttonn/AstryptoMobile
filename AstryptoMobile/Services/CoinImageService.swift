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
    private let fileManager = LocalFileManager.shared
    
    init(urlString: String) {
        getCoinImage(urlString: urlString)
        
    }
    
    private func getCoinImage(urlString: String) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self else { return }
            
            if let url = URL(string: urlString), let image = fileManager.getImage(imageName: url.lastPathComponent, folderName: "coinImages") {
           
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.image = image
                }
                return
            }
                
            downloadCoinImage(url: urlString)
        }
   
    }
    
    private func downloadCoinImage(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        coinSubscription = NetworkingManager.downloadImage(url: url)
            .tryMap { (data) -> UIImage? in
                UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedImage in
                guard let self, let returnedImage else { return }
                
                DispatchQueue.global(qos: .background).async { [weak self] in
                    self?.fileManager.saveImage(image: returnedImage, imageName: url.lastPathComponent, folderName: "coinImages")
                }
                
                image = returnedImage
                coinSubscription?.cancel()
            }
      
    }
}
