//
//  Style.swift
//  dummy-swift
//
//  Created by WAN Tung Lok on 24/4/2018.
//  Copyright © 2018年 WAN Tung Lok. All rights reserved.
//

import UIKit

enum Direction {
    case left
    case right
}

struct Style {
    struct navigationBar {
        struct button {
            static func append(_ viewController: ViewController, direction: Direction) -> UIButton? {
                guard let navigationController = viewController.navigationController else {
                    return nil
                }
                var barButtonItems: [UIBarButtonItem]?
                if (direction == .left) {
                    barButtonItems = viewController.navigationItem.leftBarButtonItems
                } else {
                    barButtonItems = viewController.navigationItem.rightBarButtonItems
                }
                if (barButtonItems == nil) {
                    barButtonItems = []
                }
                let height = navigationController.navigationBar.frame.height
                let button = UIButton(frame: CGRect(x: 0, y: 0, width: height, height: height))
                button.widthAnchor.constraint(equalToConstant: height).isActive = true
                button.heightAnchor.constraint(equalToConstant: height).isActive = true
                button.backgroundColor = UIColor.green
                let barButtonItem = UIBarButtonItem(customView: button)
                barButtonItems?.append(barButtonItem)
                if (direction == .left) {
                    viewController.navigationItem.leftBarButtonItems = barButtonItems
                } else {
                    viewController.navigationItem.rightBarButtonItems = barButtonItems
                }
                return button
            }
        }
        
        static func transparent(_ viewController: ViewController) {
            guard let navigationController = viewController.navigationController else {
                return
            }
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.isTranslucent = true
            navigationController.navigationBar.backgroundColor = .clear
            navigationController.view.backgroundColor = .clear
//            navigationController.navigationBar.barTintColor = .clear
        }
    }
}
