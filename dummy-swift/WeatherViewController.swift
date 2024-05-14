//
//  WeatherViewController.swift
//  dummy-swift
//
//  Created by Robert Wan on 14/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PresenterView {
    @IBOutlet weak var weatherTableView: UITableView!
    
    lazy var presenter = WeatherPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        weatherTableView.register(UINib(nibName: String(describing: WeatherTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WeatherTableViewCell.self))
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherTableViewCell.self), for: indexPath) as? WeatherTableViewCell {
            cell.setup(city: presenter.cities[indexPath.row])
            return cell
        } else {
            fatalError("tableView Error")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.downloadCurrentWeather(city: presenter.cities[indexPath.row])
    }
    
    func startLoading() {
        print("startLoading()")
    }
    
    func stopLoading() {
        print("stopLoading()")
    }
}
