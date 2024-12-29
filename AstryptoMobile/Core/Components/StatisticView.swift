//
//  StatisticView.swift
//  AstryptoMobile
//
//  Created by sstonn on 19/12/24.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(
                            degrees:
                                (stat.percentageChange ?? 0) >= 0 ? 0 : 180
                        )
                    )
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? .green : .red)
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.statistic1)
    }
}
