//
//  TapBarVIew.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 08.05.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabBarItem
    var tabs: [TabBarItem] = []
    
    init(selectedTab: Binding<TabBarItem> = .constant(TabBarItem(iconName: "", title: "")), tabs: [TabBarItem]) {
           self._selectedTab = selectedTab
           self.tabs = tabs
       }
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                ForEach(tabs, id:\.title) { tab in
                    TabItemView(tabItem: tab, selectedTab: $selectedTab) 
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
    TabBarView(selectedTab: .constant(TabBarItem(iconName: "house", title: "home")), tabs: [
        TabBarItem(iconName: "house", title: "home"),
        TabBarItem(iconName: "magnifyingglass", title: "search"),
        TabBarItem(iconName: "clock", title: "history"),
        TabBarItem(iconName: "person", title: "profile")
    ])
    //    TapBarVIew(selectedTab: .constant(TabBarItem(iconName: "house", title: "home")), editMode: .constant(true))
}
