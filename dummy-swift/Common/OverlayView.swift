//
//  OverlayView.swift
//  dummy-swift
//
//  Created by Robert Wan on 17/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class OverlayView: CustomView {
    @IBOutlet weak var dummyLabel: UILabel!
}

func addOverlayView(_ viewController: UIViewController) -> OverlayView {
    let size = UIScreen.main.bounds.size
    let overlayView = OverlayView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    viewController.view.addSubview(overlayView)
    return overlayView
}
