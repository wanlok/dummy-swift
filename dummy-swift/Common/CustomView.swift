//
//  CustomView.swift
//  dummy-swift
//
//  Created by Robert Wan on 17/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        view = getView()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    private func getView() -> UIView {
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else {
            fatalError("nib name error")
        }
        guard let view = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("view error")
        }
        return view
    }
}
