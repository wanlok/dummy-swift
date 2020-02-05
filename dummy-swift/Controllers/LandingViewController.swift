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

        Style.navigationBar.transparent(self)
        
        let button = Style.navigationBar.button.append(self, direction: .right)
        Style.navigationBar.button.append(self, direction: .right)
        Style.navigationBar.button.append(self, direction: .right)
        Style.navigationBar.button.append(self, direction: .left)
        Style.navigationBar.button.append(self, direction: .left)
        button?.addTarget(self, action: #selector(onButtonClicked), for: .touchUpInside)
    }
    
    @objc func onButtonClicked() {
        print("onButtonClicked()")
    }
}
