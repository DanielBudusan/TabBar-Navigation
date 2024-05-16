//
//  TabBarItem.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 09.05.2024.
//

import SwiftUI

struct TabBarItem: Equatable, Hashable{
    var iconName: String
    var title: String
    var color: Color
    var action: (() -> Void)?
    
    private static var nextID: Int = 0
  
    let id: Int
    
    init(iconName: String, title: String, color: Color = .gray, action: (() -> Void)? = nil) {
        self.iconName = iconName
        self.title = title
        self.action = action
        self.color = color
        self.id = TabBarItem.nextID
        TabBarItem.nextID += 1
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(iconName)
            hasher.combine(title)
            hasher.combine(color)
        }
    
    static func == (lhs: TabBarItem, rhs: TabBarItem) -> Bool {
        lhs.title == rhs.title
    }
    
}
