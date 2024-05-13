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
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabs, id:\.title) { tab in
                    Button {
                        withAnimation {
                            selectedTab = tab
                        }
                    } label: {
                        Image(systemName: tab.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                    }
                    .padding()
                    .foregroundStyle(selectedTab == tab ? .blue : .gray)
                    Spacer()
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
    TabBarView(selectedTab: .constant(TabBarItem(iconName: "house", title: "home")))
//    TapBarVIew(selectedTab: .constant(TabBarItem(iconName: "house", title: "home")), editMode: .constant(true))
}
