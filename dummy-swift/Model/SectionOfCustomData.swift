//
//  SectionOfCustomData.swift
//  mvvm-ios
//
//  Created by Robert Wan on 21/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import Foundation
import RxDataSources

struct SectionOfCustomData {
    var header: String
    var footer: String
    var items: [TableViewItem]
}

extension SectionOfCustomData: SectionModelType {
    typealias Item = TableViewItem

    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}
