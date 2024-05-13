//
//  TabBarItem.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 09.05.2024.
//

import Foundation

struct TabBarItem: Hashable {
    var iconName: String
    var title: String
    
    init(iconName: String, title: String) {
        self.iconName = iconName
        self.title = title
    }
}
