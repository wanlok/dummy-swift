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
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        let identifier = String(describing: WeatherTableViewCell.self)
        weatherTableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        if #available(iOS 10.0, *) {
            weatherTableView.refreshControl = refreshControl
        } else {
            weatherTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        presenter.download()
    }
    
    @objc func refresh(_ sender: Any) {
        presenter.download()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: WeatherTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? WeatherTableViewCell else {
            fatalError("tableView Error")
        }
        cell.setup(city: presenter.cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter.downloadCurrentWeather(city: presenter.cities[indexPath.row])
    }
    
    func startLoading() {
        print("startLoading()")
    }
    
    func stopLoading() {
        print("stopLoading()")
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }
    
    func prompt(message: String) {
        print(message)
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.weatherTableView.reloadData()
        }
    }
}
