//
//  TabBarItemView.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 14.05.2024.
//

import SwiftUI

struct TabItemView: View {
    var tabItem: TabBarItem
    @EnvironmentObject private var tabBarSelection: TabBarSelection
    
    init(tabItem: TabBarItem) {
            self.tabItem = tabItem

        }

    var body: some View {
        Button {
            withAnimation {
                if let action = tabItem.action {
                    action()
                } else {
                    withAnimation {
                        tabBarSelection.previousSelectedItem = tabBarSelection.item
                        tabBarSelection.item = tabItem
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
        .foregroundStyle(tabBarSelection.item == tabItem ? .blue : tabItem.color)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    TabItemView(tabItem: TabBarItem(iconName: "house", title: "home", color: .red))
        .environmentObject(TabBarSelection(selectedTab: .constant(.init(iconName: "house", title: "home")), previousSelectedTab: .constant(.init(iconName: "house", title: "home"))))
}
