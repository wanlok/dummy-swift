//
//  WeatherTableViewCell.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var lowestTemperatureLabel: UILabel!
    @IBOutlet weak var highestTemperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(city: City) {
        cityLabel.text = city.name
        if let celsius = getCelsius(kelvin: city.temp) {
            temperatureLabel.text = "\(celsius)°C"
        } else {
            temperatureLabel.text = ""
        }
        if let celsius = getCelsius(kelvin: city.tempMin) {
            lowestTemperatureLabel.text = "\(celsius)°C"
        } else {
            lowestTemperatureLabel.text = ""
        }
        if let celsius = getCelsius(kelvin: city.tempMax) {
            highestTemperatureLabel.text = "\(celsius)°C"
        } else {
            highestTemperatureLabel.text = ""
        }
    }
}
