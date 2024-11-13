//
//  ContentView.swift
//  AstryptoMobile
//
//  Created by sstonn on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.accent
            VStack {
                Text("Astrypto Mobile")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
