//
//  LandingViewController.swift
//  dummy-swift
//
//  Created by WAN Tung Lok on 24/4/2018.
//  Copyright © 2018年 WAN Tung Lok. All rights reserved.
//

import UIKit

class LandingViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Landing"
    }
    
    @IBAction func onWeatherButtonClicked(_ sender: Any) {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
}
