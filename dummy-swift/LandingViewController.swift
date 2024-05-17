//
//  LandingViewController.swift
//  dummy-swift
//
//  Created by WAN Tung Lok on 24/4/2018.
//  Copyright © 2018年 WAN Tung Lok. All rights reserved.
//

import UIKit

class LandingViewController: ViewController {

    var confirmationDialog: ConfirmationDialog? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Landing"
        
        confirmationDialog = getConfirmationDialog(self)
        confirmationDialog?.label.text = "Error"
        confirmationDialog?.button.setTitle("OK", for: .normal)
        confirmationDialog?.button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
    }
    
    @IBAction func onWeatherButtonClicked(_ sender: Any) {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
    
    @objc func buttonClicked() {
        confirmationDialog?.removeFromSuperview()
    }
}
