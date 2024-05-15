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

struct CustomToolbarModifier<V>: ViewModifier where V: View {
    let toolbarButtons: () -> V
    
    func body(content: Content) -> some View {
        VStack {
            content
            toolbarButtons()
        }
    }
}

extension View {
    func customToolbar<V: View>(content: @escaping () -> V) -> some View {
        return modifier(CustomToolbarModifier(toolbarButtons: content))
    }
}

struct TabBarVisibility: ViewModifier {
    let isVisibile: Bool
    
    func body(content: Content) -> some View {
        return content
            .preference(key: VisibilityPreferenceKey.self, value: isVisibile)
    }
}

extension View {
    func tabBarItem(iconName: String, title: String) -> some View {
        let tab = TabBarItem(iconName: iconName, title: title)
        return modifier(TabBarItemViewModifer(tab: tab))
    }
}

extension View {
    func tabBarHidden(_ isVisible: Bool) -> some View {
        return modifier(TabBarVisibility(isVisibile: isVisible))
    }
}


