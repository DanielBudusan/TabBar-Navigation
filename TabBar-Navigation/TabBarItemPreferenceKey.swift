//
//  TabBarItemPreferenceKey.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 10.05.2024.
//

import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}


