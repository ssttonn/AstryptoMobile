//
//  AstryptoMobileApp.swift
//  AstryptoMobile
//
//  Created by sstonn on 5/11/24.
//

import SwiftUI

@main
struct AstryptoMobileApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
