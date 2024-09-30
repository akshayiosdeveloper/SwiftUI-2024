//
//  Number+Ext.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 30/09/24.
//

import Foundation

extension NumberFormatter {
    static func currency(from value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? ""
        
        return "$" + formattedValue
    }
}
