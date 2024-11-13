//
//  CircleButtonView.swift
//  AstryptoMobile
//
//  Created by sstonn on 5/11/24.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    init(iconName: String = "heart.fill") {
        self.iconName = iconName
    }
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.theme.background)
            )
            .shadow(color: .theme.accent.opacity(0.25), radius: 10, x: 0, y:0)
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(
        iconName: "plus"
    )
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(
        iconName: "info"
    )
        .preferredColorScheme(.dark)
}
