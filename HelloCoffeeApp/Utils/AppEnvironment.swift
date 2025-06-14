//
//  AppEnvironment.swift
//  HelloCoffeeApp
//
//  Created by Pratik Ghadge on 08/06/25.
//

import Foundation

enum Endpoints {
    case allOrders
    case placeOrder
    
    var path: String {
        switch self {
        case .allOrders:
            return "/orders"
        case .placeOrder:
            return "/newOrder"
        }
    }
}

struct Configurations {
    lazy var environment: AppEnvironment = {
       
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
    }()
}

enum AppEnvironment: String {
    case test
    case dev
    
    var baseUrl: URL {
        switch self {
        case .test:
            return URL(string: "https://island-bramble.glitch.me")!
        case .dev:
            return URL(string: "https://island-bramble.glitch.me")!
        }
    }
}
