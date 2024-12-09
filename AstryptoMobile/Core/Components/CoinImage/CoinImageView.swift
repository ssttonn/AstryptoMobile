//
//  CoinImageView.swift
//  AstryptoMobile
//
//  Created by sstonn on 9/12/24.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject private var vm: CoinImageViewModel
    
    init(urlString: String) {
        self._vm = StateObject(wrappedValue: CoinImageViewModel(urlString: urlString))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(
            urlString: dev.coin.image
        )
    }
}
