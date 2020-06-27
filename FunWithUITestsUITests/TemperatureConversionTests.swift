//
//  TemperatureConversionTests.swift
//  FunWithUITestsUITests
//
//  Created by Robert Huston on 6/26/20.
//  Copyright © 2020 Robert Huston. All rights reserved.
//

import XCTest

class TemperatureConversionTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testConvertFahrenheit_32F_to_0C() throws {
        // The Fahrenheit UITextField in the HomeViewController Scene in the Main storyboard
        // has its accessibility identifier set to "Fahrenheit"
        let fahrenheitTextField = app.textFields["Fahrenheit"]

        // Bring up keyboard on Fahrenheit UITextField
        fahrenheitTextField.tap()

        // Field defaults to -40.0, so we need 5 deletes
        let deleteKey = app.keyboards.keys["delete"]
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()

        // Instead of tapping the number keys, we'll just type in the new text
        fahrenheitTextField.typeText("32")

        // Dismiss the keyboard
        app.keyboards.buttons["Done"].tap()

        // Now let's see what we got
        let celsiusTextField = app.textFields["Celsius"]
        let celsiusValue = celsiusTextField.value as! String
        XCTAssertEqual(celsiusValue, "0.0")
    }

    func testConvertCelsius_100C_to_212F() throws {
        // The Celsius UITextField in the HomeViewController Scene in the Main storyboard
        // has its accessibility identifier set to "Celsius"
        let celsiusTextField = app.textFields["Celsius"]

        // Bring up keyboard on Celsius UITextField
        celsiusTextField.tap()

        // Field defaults to -40.0, so we need 5 deletes
        let deleteKey = app.keyboards.keys["delete"]
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()

        // Instead of tapping the number keys, we'll just type in the new text
        celsiusTextField.typeText("100")

        // Dismiss the keyboard
        app.keyboards.buttons["Done"].tap()

        // Now let's see what we got
        let fahrenheitTextField = app.textFields["Fahrenheit"]
        let fahrenheitValue = fahrenheitTextField.value as! String
        XCTAssertEqual(fahrenheitValue, "212.0")
    }

}
