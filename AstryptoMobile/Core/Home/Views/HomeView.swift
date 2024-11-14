//
//  HomeView.swift
//  AstryptoMobile
//
//  Created by sstonn on 5/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var isShowingPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                homeHeader
                columnTitles
                if !isShowingPortfolio {
                    allCoinList
                    .transition(.move(edge: .leading))
                } else {
                    portfolioCoinList
                    .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
            .background(.white)
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: isShowingPortfolio ? "plus" : "info")
                .animation(.none, value: isShowingPortfolio)
                .background(
                    CircleButtonAnimationView(isAnimating: $isShowingPortfolio)
                )
            Spacer()
            Text(isShowingPortfolio ? "Portfolio" : "About")
                .font(.headline)
                .fontWeight(.heavy)
                .animation(.none, value: isShowingPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: isShowingPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        isShowingPortfolio.toggle()
                    }
                }
        }
        
    }
    
    private var allCoinList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin)
                    .listRowInsets(.init(.zero))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinList: some View {
        List {
            ForEach(vm.porfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(.zero))
            }
        }
        .padding(0)
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack(spacing: 0) {
            Text("Coin")
            Spacer()
            if isShowingPortfolio {
                Text("Holdings")
                    .transition(.blurReplace)
            }
            Text("Price")
                .frame(minWidth: UIScreen.main.bounds.width / 3, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal, 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }.environmentObject(dev.homeVM)
    }
}



