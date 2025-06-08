//
//  AddCoffeeView.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    
    var body: some View {
        VStack {
            Text("Add New Coffee Order")
            Form {
                TextField("Name", text: $name).accessibilityIdentifier("name")
                TextField("Coffee Name", text: $coffeeName).accessibilityIdentifier("coffeeName")
                TextField("Price", text: $price).accessibilityIdentifier("price")
                Picker("Select Size", selection: $coffeeSize) {
                    ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
                        Text(size.rawValue).tag(size)
                    }
                }.pickerStyle(.segmented)
                
                Button("Place Order") {
                    
                }.accessibilityIdentifier("placeOrderButton")
                    .centerHorizontally()
            }
        }
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeView()
    }
}
