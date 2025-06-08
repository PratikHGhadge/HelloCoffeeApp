//
//  View+Extensions.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
