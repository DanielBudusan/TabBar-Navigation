//
//  CustomTabView.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 10.05.2024.
//

import SwiftUI


class TabBarSelection: ObservableObject {
    @Binding var item: TabBarItem
    
    init(selectedTab: Binding<TabBarItem>) {
        self._item = selectedTab
    }
}

struct CustomTabView<Content:View>: View {
    private var selectedTab: TabBarSelection
    @State private var tabs: [TabBarItem] = []
    let content: Content
    
    init(selectedTab: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.selectedTab = .init(selectedTab: selectedTab)
    }
    
    var body: some View {
        ZStack {
            content
                
            VStack {
                Spacer()
                TabBarView(selectedTab: selectedTab.$item, tabs: tabs)
            }
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
        .environmentObject(selectedTab)
        
    }
}

#Preview {
    CustomTabView(selectedTab: .constant(.init(iconName: "house", title: "home"))) {
        HomeView()
    }
}
