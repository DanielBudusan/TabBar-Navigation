//
//  TabBarViewModifier.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 10.05.2024.
//

import SwiftUI

struct TabBarItemViewModifer: ViewModifier {
    @EnvironmentObject private var selectedTab: TabBarSelection
    let tab: TabBarItem
    
    func body(content: Content) -> some View {
        Group {
            if tab == selectedTab.item {
                content
//                    .transition(AnyTransition.move(edge: .leading).combined(with: .opacity))
            } else {
                Color.clear
                
            }
        }
        .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(iconName: String, title: String) -> some View {
        let tab = TabBarItem(iconName: iconName, title: title)
        return modifier(TabBarItemViewModifer(tab: tab))
    }
}
