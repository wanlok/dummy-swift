//
//  PresenterView.swift
//  dummy-swift
//
//  Created by Robert Wan on 15/5/2024.
//  Copyright © 2024 WAN Tung Lok. All rights reserved.
//

import Foundation

protocol PresenterView: class {
    func startLoading()
    func stopLoading()
    func prompt(message: String)
    func reload()
}
