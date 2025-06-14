//
//  AddCoffeeView.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import SwiftUI

struct AddCoffeeErrors {
    var name: String = ""
    var coffeeName: String = ""
    var price: String = ""
}

struct AddCoffeeView: View {
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    @State private var errors: AddCoffeeErrors = AddCoffeeErrors()
    
    @EnvironmentObject private var model: CoffeeModel
    @Environment(\.dismiss) var dismiss
    
    var isValid: Bool {
        
        errors = AddCoffeeErrors()
        
        // This not business rule, this are ui validations
        if name.isEmpty {
            errors.name = "Name can not be empty!"
        }
        
        if coffeeName.isEmpty {
            errors.coffeeName = "Coffee name can not be empty!"
        }
        
        if price.isEmpty {
            errors.price = "Price can not be empty!"
        } else if !price.isNumeric {
            errors.price = "Price should be Numeric!"
        } else if price.isLessThan(0) {
            errors.price = "Price can not be negative!"
        }
        
        return errors.name.isEmpty && errors.price.isEmpty && errors.coffeeName.isEmpty
    }
    
    private func placeOrder() async {
        let order = Order(name: name, coffeeName: coffeeName, total: Double(price) ?? 0, size: coffeeSize)
        do {
            try await model.placeOrder(order)
            dismiss()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Name", text: $name).accessibilityIdentifier("name")
                    Text(errors.name).visible(!errors.name.isEmpty).font(.caption)
                    TextField("Coffee Name", text: $coffeeName).accessibilityIdentifier("coffeeName")
                    Text(errors.coffeeName).visible(!errors.coffeeName.isEmpty).font(.caption)
                    TextField("Price", text: $price).accessibilityIdentifier("price")
                    Text(errors.price).visible(!errors.price.isEmpty).font(.caption)
                    Picker("Select Size", selection: $coffeeSize) {
                        ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
                            Text(size.rawValue).tag(size)
                        }
                    }.pickerStyle(.segmented)
                    
                    Button("Place Order") {
                        
                        if isValid {
                            Task {
                                await placeOrder()
                            }
                        }
                        
                    }.accessibilityIdentifier("placeOrderButton")
                        .centerHorizontally()
                }
            }
            .navigationTitle("Add New Coffee Order")
        }
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeView()
    }
}
