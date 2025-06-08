//
//  HelloCoffeeAppUITests.swift
//  HelloCoffeeAppUITests
//
//  Created by Pratik Ghadge on 07/06/25.
//

import XCTest

final class HelloCoffeeAppUITests: XCTestCase {

    func test_should_make_sure_no_order_msg_displayed() throws {

        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
        
        XCTAssertEqual("No orders avilable!", app.staticTexts["noOrderText"].label)
        
    }

}
