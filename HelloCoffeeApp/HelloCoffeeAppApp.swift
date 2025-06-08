//
//  HelloCoffeeAppApp.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 07/06/25.
//

import SwiftUI

@main
struct HelloCoffeeAppApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        var config = Configurations()
        let webService = WebService(baseUrl: config.environment.baseUrl)
        _model = StateObject(wrappedValue: CoffeeModel(webService: webService))
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
