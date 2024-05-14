//
//  City.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import Foundation

class City {
    var name: String
    var latitude: Double
    var longitude: Double
    var temp: Double?
    var tempMax: Double?
    var tempMin: Double?
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
