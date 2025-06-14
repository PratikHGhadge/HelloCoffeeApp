//
//  String+Extensions.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import Foundation

extension String {
    
    var isNumeric: Bool {
         Double(self) != nil
    }
    
    func isLessThan(_ number: Double) -> Bool {
        if !self.isNumeric {
            return false
        }
        
        guard let value = Double(self) else {
            return false
        }
        
        return value < number
    }
    
    
}
