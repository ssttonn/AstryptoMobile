//
//  UIApplication.swift
//  AstryptoMobile
//
//  Created by sstonn on 11/12/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
