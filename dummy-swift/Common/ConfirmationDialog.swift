//
//  OverlayView.swift
//  dummy-swift
//
//  Created by Robert Wan on 17/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class ConfirmationDialog: CustomView {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
}

func getConfirmationDialog(_ viewController: UIViewController) -> ConfirmationDialog {
    let size = UIScreen.main.bounds.size
    let confirmationDialog = ConfirmationDialog(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    viewController.view.addSubview(confirmationDialog)
    return confirmationDialog
}
