//
//  CircleButtonAnimationView.swift
//  AstryptoMobile
//
//  Created by sstonn on 5/11/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        Circle()
            .stroke(
                lineWidth: 5.0
            )
            .scale(isAnimating ? 1 : 0)
            .opacity(isAnimating ? 0 : 1)
            .animation(isAnimating ? .easeOut : .none, value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(isAnimating: .constant(false))
        .frame(width: 100, height: 100)
}
