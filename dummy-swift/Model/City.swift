//
//  City.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import Foundation

struct City {
    var name: String
    var latitude: Double
    var longitude: Double
}

func getTargetCities() -> [City] {
    return [
        City(name: "Sydney", latitude: -33.867926, longitude: 151.21013810170962),
        City(name: "Melbourne", latitude: -37.8141705, longitude: 144.9655616),
        City(name: "Brisbane", latitude: -27.4689682, longitude: 153.0234991),
        City(name: "Adelaide", latitude: -34.9261502, longitude: 138.6006231426997),
        City(name: "Perth", latitude: -31.954800499999997, longitude: 115.85837364402198),
    ]
}
