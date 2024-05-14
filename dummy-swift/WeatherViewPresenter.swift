//
//  WeatherViewPresenter.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import Foundation

protocol PresenterView: class {
    func startLoading()
    func stopLoading()
}

class WeatherPresenter {
    weak var presenterView:PresenterView?

    let appid = ""
    
    let cities = [
        City(name: "Sydney", latitude: -33.867926, longitude: 151.21013810170962),
        City(name: "Melbourne", latitude: -37.8141705, longitude: 144.9655616),
        City(name: "Brisbane", latitude: -27.4689682, longitude: 153.0234991),
        City(name: "Adelaide", latitude: -34.9261502, longitude: 138.6006231426997),
        City(name: "Perth", latitude: -31.954800499999997, longitude: 115.85837364402198),
    ]
    
    init(view:PresenterView) {
        self.presenterView = view
    }
    
    func downloadCurrentWeather(city: City) {
        presenterView?.startLoading()
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=\(appid)&lat=\(city.latitude)&lon=\(city.longitude)") else {
            presenterView?.stopLoading()
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                self.presenterView?.stopLoading()
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                self.presenterView?.stopLoading()
                return
            }
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                self.presenterView?.stopLoading()
                return
            }
            self.presenterView?.stopLoading()
            print(json)
        }).resume()
    }
}
