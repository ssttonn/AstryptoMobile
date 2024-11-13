//
//  HomeView.swift
//  AstryptoMobile
//
//  Created by sstonn on 5/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }.padding(.horizontal)
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
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
}
