//
//  ScreenChangeTests.swift
//  FunWithUITestsUITests
//
//  Created by Robert Huston on 6/26/20.
//  Copyright © 2020 Robert Huston. All rights reserved.
//

import XCTest

class ScreenChangeTests: XCTestCase {

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

    func testGoToFoo() {
        app.buttons["Foo"].tap()
        let label = app.staticTexts["Welcome to Foo"]
        XCTAssert(label.exists)
    }

    func testGoToFooAndBack() {
        var label: XCUIElement

        app.buttons["Foo"].tap()
        label = app.staticTexts["Welcome to Foo"]
        XCTAssert(label.exists)

        app.navigationBars["FunWithUITests.FooView"].buttons["Back"].tap()
        label = app.staticTexts["Home"]
        XCTAssert(label.exists)
    }

    func testGoToFooBarDismissAndBack() {
        var label: XCUIElement

        app.buttons["Foo"].tap()
        label = app.staticTexts["Welcome to Foo"]
        XCTAssert(label.exists)

        app.buttons["Bar"].tap()
        label = app.staticTexts["Welcome to Bar"]
        XCTAssert(label.exists)

        app.buttons["Dismiss"].tap()
        app.navigationBars["FunWithUITests.FooView"].buttons["Back"].tap()
        label = app.staticTexts["Home"]
        XCTAssert(label.exists)
    }

}
