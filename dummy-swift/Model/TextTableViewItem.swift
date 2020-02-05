//
//  TextTableViewItem.swift
//  mvvm-ios
//
//  Created by Robert Wan on 22/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import Foundation

class TextTableViewItem: TableViewItem {
    
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
}
