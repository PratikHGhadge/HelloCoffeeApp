//
//  OrderCellView.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import Foundation
import SwiftUI

struct OrderCellView: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            VStack {
                Text(order.name).accessibilityIdentifier("orderNameText").bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .accessibilityIdentifier("coffeeNameAndSizeText")
                    .opacity(0.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("coffeePriceText")
        }
    }
}
