//
//  Double+Extensions.swift
//  AstryptoMobile
//
//  Created by sstonn on 13/11/24.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func currencyFormatted() -> String {
        currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

