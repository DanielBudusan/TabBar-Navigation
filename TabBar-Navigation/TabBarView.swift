//
//  TapBarVIew.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 08.05.2024.
//

import SwiftUI

struct TabBarView: View {
    var tabs: [TabBarItem] = []
    
    init(tabs: [TabBarItem]) {
        self.tabs = tabs
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                ForEach(tabs, id:\.title) { tab in
                    TabItemView(tabItem: tab)
                }
            }
            .frame(height: 100)
            .background(.white.opacity(0.6))
            .clipShape(.rect(cornerRadius: 35))
            .padding()
        }
    }
}

#Preview {
    TabBarView(tabs: [
        TabBarItem(iconName: "house", title: "home"),
        TabBarItem(iconName: "magnifyingglass", title: "search"),
        TabBarItem(iconName: "clock", title: "history"),
        TabBarItem(iconName: "person", title: "profile")
    ])
    //    TapBarVIew(selectedTab: .constant(TabBarItem(iconName: "house", title: "home")), editMode: .constant(true))
    .environmentObject(TabBarSelection(selectedTab: .constant(.init(iconName: "house", title: "home")), previousSelectedTab: .constant(.init(iconName: "house", title: "home"))))
}
