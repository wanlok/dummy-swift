//
//  WeatherViewController.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource {

    var cities = getTargetCities()
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        weatherTableView.register(UINib(nibName: String(describing: WeatherTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WeatherTableViewCell.self))
        weatherTableView.dataSource = self
//        weatherTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherTableViewCell.self), for: indexPath) as? WeatherTableViewCell {
            let city = cities[indexPath.row]
            cell.cityLabel.text = city.name
            return cell
        } else {
            fatalError("tableView Error")
        }
    }
}
