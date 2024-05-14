//
//  Utils.swift
//  dummy-swift
//
//  Created by Robert Wan on 15/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import Foundation

func download(urlString: String, success: @escaping (Any)->(), fail: @escaping ()->()) {
    guard let url = URL(string: urlString) else {
        fail()
        return
    }
    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        guard error == nil else {
            fail()
            return
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            fail()
            return
        }
        guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            fail()
            return
        }
        success(json)
    }).resume()
}

func getPlist(name: String) -> Any {
    guard let path = Bundle.main.path(forResource: name, ofType: "plist") else {
        fatalError("plist path error")
    }
    guard let data = FileManager.default.contents(atPath: path) else {
        fatalError("plist data error")
    }
    guard let plist = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) else {
        fatalError("plist error")
    }
    return plist
}

func getCelsius(kelvin: Double?, placeholder: Double=0) -> Double {
    var celsius = placeholder
    if let kelvin = kelvin {
        celsius = kelvin - 273.15
    }
    return round(celsius * 100) / 100.0
}


