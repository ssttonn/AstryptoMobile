//
//  HomeStatsView.swift
//  AstryptoMobile
//
//  Created by sstonn on 28/12/24.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
        .animation(.smooth, value: showPortfolio)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
}
