//
//  NumberFormatter+Extensions.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter 
    }
}
