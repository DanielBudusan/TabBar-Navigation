//
//  CustomTabView.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 10.05.2024.
//

import SwiftUI

class TabBarSelection: ObservableObject {
    @Binding var item: TabBarItem
    @Binding var previousSelectedItem: TabBarItem

    init(selectedTab: Binding<TabBarItem>, previousSelectedTab: Binding<TabBarItem>) {
        self._item = selectedTab
        self._previousSelectedItem = previousSelectedTab
   
    }
}

struct CustomTabView<Content:View>: View {
    private var tabBarSelection: TabBarSelection
    @State private var tabs: [TabBarItem] = []
    @State private var isTabBarHidden = false
    let content: Content
    
    init(selectedTab: Binding<TabBarItem>, previousSelectedTab: Binding<TabBarItem>,  @ViewBuilder content: () -> Content) {
        self.tabBarSelection = .init(selectedTab: selectedTab, previousSelectedTab: previousSelectedTab)
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
                .onPreferenceChange(VisibilityPreferenceKey.self, perform: { value in
                    withAnimation {
                        self.isTabBarHidden = value
                    }
                })
            
            VStack {
                Spacer()
                if !isTabBarHidden {
                    TabBarView(tabs: tabs)
                        .transition(.move(edge: .bottom))
                } 
            }
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
        
        .environmentObject(tabBarSelection)
        
    }
}

extension CustomTabView {
    func toolbar (@ViewBuilder content: @escaping () -> Content) -> Content {
        content()
    }
}

#Preview {
    CustomTabView(selectedTab: .constant(.init(iconName: "house", title: "home")), previousSelectedTab: .constant(.init(iconName: "house", title: "home"))) {
        HomeView()
    }
}
