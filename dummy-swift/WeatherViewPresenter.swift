//
//  WeatherViewPresenter.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import Foundation

class WeatherPresenter {
    weak var presenterView:PresenterView?

    var cities = [
        City(name: "Sydney", latitude: -33.867926, longitude: 151.21013810170962),
        City(name: "Melbourne", latitude: -37.8141705, longitude: 144.9655616),
        City(name: "Brisbane", latitude: -27.4689682, longitude: 153.0234991),
        City(name: "Adelaide", latitude: -34.9261502, longitude: 138.6006231426997),
        City(name: "Perth", latitude: -31.954800499999997, longitude: 115.85837364402198),
    ]
    
    init(view: PresenterView) {
        self.presenterView = view
    }
    
    func download(city: City, callback: @escaping (City, [String: Any]?)->()) {
        guard let plist = getPlist(name: "secret") as? [String: Any], let appid = plist["appid"] else {
            return
        }
        let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=\(appid)&lat=\(city.latitude)&lon=\(city.longitude)"
        dummy_swift.download(urlString: urlString, success: { json in
            callback(city, json as? [String : Any])
        }, fail: {
            callback(city, nil)
        })
    }
    
    func download() {
        presenterView?.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            var downloadedCities: [City] = []
            for city in self.cities {
                self.download(city: city, callback: { city, json in
                    let main = json?["main"] as? [String: Any]
                    city.temp = main?["temp"] as? Double
                    city.tempMin = main?["temp_min"] as? Double
                    city.tempMax = main?["temp_max"] as? Double
                    downloadedCities.append(city)
                    if downloadedCities.count == self.cities.count {
                        self.presenterView?.stopLoading()
                        self.presenterView?.reload()
                    }
                })
            }
        }
    }
}
