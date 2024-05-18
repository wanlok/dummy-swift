//
//  LandingViewController.swift
//  dummy-swift
//
//  Created by WAN Tung Lok on 24/4/2018.
//  Copyright © 2018年 WAN Tung Lok. All rights reserved.
//

import UIKit

class LandingViewController: ViewController {

    var okDialog: OKDialog? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Landing"
    }
    
    @IBAction func onWeatherButtonClicked(_ sender: Any) {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
    
    @IBAction func onConfirmationDialogButtonClicked(_ sender: Any) {
        okDialog = getOKDialog(self)
        okDialog?.label.text = "Press OK to close"
        okDialog?.button.setTitle("OK", for: .normal)
        okDialog?.button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        okDialog?.removeFromSuperview()
        okDialog = nil
    }
}
