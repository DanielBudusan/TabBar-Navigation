//
//  TabBarItemView.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 14.05.2024.
//

import SwiftUI

struct TabItemView: View {
    var tabItem: TabBarItem
    @Binding var selectedTab: TabBarItem
    
    init(tabItem: TabBarItem, selectedTab: Binding<TabBarItem> = .constant(TabBarItem(iconName: "", title: ""))) {
            self.tabItem = tabItem
            self._selectedTab = selectedTab
        }

    var body: some View {
        Button {
            withAnimation {
                if let action = tabItem.action {
                    action()
                } else {
                    withAnimation {
                        selectedTab = tabItem
                    }
                }
            }
        } label: {
            Image(systemName: tabItem.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 35)
        }
        .padding()
        .foregroundStyle(selectedTab == tabItem ? .blue : tabItem.color)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    TabItemView(tabItem: TabBarItem(iconName: "house", title: "home", color: .red), selectedTab: .constant(TabBarItem(iconName: "clock", title: "history")))
}
