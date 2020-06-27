//
//  TemperatureConverter.swift
//  FunWithUITests
//
//  Created by Robert Huston on 6/26/20.
//  Copyright © 2020 Robert Huston. All rights reserved.
//

import Foundation

class TemperatureConverter {

    static public func convert(celsius: Float) -> Float {
        return celsius * 9 / 5 + 32
    }

    static public func convert(fahrenheit: Float) -> Float {
        return (fahrenheit - 32) * 5 / 9
    }

}
