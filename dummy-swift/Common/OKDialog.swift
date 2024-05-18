//
//  OKDialog.swift
//  dummy-swift
//
//  Created by Robert Wan on 17/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class OKDialog: CustomView {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
}

func getOKDialog(_ viewController: UIViewController) -> OKDialog {
    let size = UIScreen.main.bounds.size
    let okDialog = OKDialog(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    viewController.view.addSubview(okDialog)
    return okDialog
}
