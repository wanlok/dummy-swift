//
//  ViewController.swift
//  dummy-swift
//
//  Created by WAN Tung Lok on 24/4/2018.
//  Copyright © 2018年 WAN Tung Lok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLayoutConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(iOS 11, *) {
            
        } else {
            topLayoutConstraint.constant = 64
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
