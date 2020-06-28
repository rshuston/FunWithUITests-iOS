//
//  TemperatureConverterTests.swift
//  FunWithUITestsTests
//
//  Created by Robert Huston on 6/26/20.
//  Copyright © 2020 Robert Huston. All rights reserved.
//

import XCTest

@testable import FunWithUITests

class TemperatureConverterTests: XCTestCase {

    // MARK: - Celsius conversion

    func testConvert_0C_to_32F() throws {
        let fahrenheit = TemperatureConverter.convert(celsius: 0.0)
        XCTAssertEqual(fahrenheit, 32.0)
    }

    func testConvert_100C_to_212F() throws {
        let fahrenheit = TemperatureConverter.convert(celsius: 100.0)
        XCTAssertEqual(fahrenheit, 212.0)
    }

    func testConvert_m15C_to_5F() throws {
        let fahrenheit = TemperatureConverter.convert(celsius: -15.0)
        XCTAssertEqual(fahrenheit, 5.0)
    }

    func testConvert_m40C_to_m40F() throws {
        let fahrenheit = TemperatureConverter.convert(celsius: -40.0)
        XCTAssertEqual(fahrenheit, -40.0)
    }

    // MARK: - Fahrenheit conversion

    func testConvert_5F_to_m15C() throws {
        let celsius = TemperatureConverter.convert(fahrenheit: 5.0)
        XCTAssertEqual(celsius, -15.0)
    }

    func testConvert_32F_to_0C() throws {
        let celsius = TemperatureConverter.convert(fahrenheit: 32.0)
        XCTAssertEqual(celsius, 0.0)
    }

    func testConvert_212F_to_100C() throws {
        let celsius = TemperatureConverter.convert(fahrenheit: 212.0)
        XCTAssertEqual(celsius, 100.0)
    }

    func testConvert_m40F_to_m40C() throws {
        let celsius = TemperatureConverter.convert(fahrenheit: -40.0)
        XCTAssertEqual(celsius, -40.0)
    }

}
