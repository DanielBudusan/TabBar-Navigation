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
    @State private var offSet:CGFloat = 0
    
    func body(content: Content) -> some View {
        print(selectedTab.item.id)
        print(selectedTab.previousSelectedItem.id)
        return Group {
            GeometryReader { geometry in
                let width = geometry.size.width
                if tab == selectedTab.item {
                    content
                        .offset(x: offSet)
                        .onAppear {
                            withAnimation {
                                offSet = 0
                            }
                        }
                } else if tab == selectedTab.previousSelectedItem && tab.id < selectedTab.item.id {
                    content
                        .offset(x: offSet)
                        .onAppear {
                            withAnimation {
                                offSet = -width
                            }
                        }
                        
                } else if tab == selectedTab.previousSelectedItem && tab.id > selectedTab.item.id {
                    content
                        .offset(x: offSet)
                        .onAppear {
                            withAnimation {
                                offSet = width
                            }
                        }
                } else if tab.id < selectedTab.item.id {
                    content
                        .offset(x: offSet)
                        .onAppear {
                                offSet = -width
                        }
                } else {
                    content
                        .offset(x: offSet)
                        .onAppear {
                                offSet = width
                        }
                }
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


