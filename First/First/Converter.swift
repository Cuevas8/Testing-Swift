//
//  Converter.swift
//  First
//
//  Created by Bryan Cuevas on 4/27/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
}
