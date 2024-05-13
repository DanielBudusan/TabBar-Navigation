//
//  ContentView.swift
//  TabBar-Navigation
//
//  Created by Daniel Budusan on 30.04.2024.
//

import SwiftUI

//enum Tab: String, CaseIterable{
//    case home = "house"
//    case search = "magnifyingglass"
//    case history = "clock"
//    case profile = "person"
//}
//
//enum EditButtons: String, CaseIterable {
//    case back = "arrowshape.backward"
//    case bin = "xmark.bin"
//    case unFavorite = "star.slash"
//    case favorite = "star.fill"
//}

struct ContentView: View {
    @State private var selectedTab: TabBarItem = .init(iconName: "house", title: "home")
    
    var body: some View {
        CustomTabView(selectedTab: $selectedTab) {
            HomeView()
                .tabBarItem(iconName: "house", title: "home")
            SearchView()
                .tabBarItem(iconName: "magnifyingglass", title: "search")
            HistoryView()
                .tabBarItem(iconName: "clock", title: "history")
            ProfileView()
                .tabBarItem(iconName: "person", title: "profile")
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.blue.opacity(0.5)
                VStack {
                    Text("Home")
                    NavigationLink("Push next") {
                        DetailView()
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct SearchView: View {
    var body: some View {
        ZStack{
            Color.red.opacity(0.5)
            Text("Search")
        }
        .ignoresSafeArea(.all)
    }
}

struct HistoryView: View {
    
    var body: some View {
        ZStack{
            Color.purple.opacity(0.5)
            VStack {
                Text("History")
                Button("Edit") {
                
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.green.opacity(0.5)
            Text("Profile")
        }
        .ignoresSafeArea(.all)
    }
}

struct DetailView: View {
    var body: some View {
        ZStack {
            Color.orange.opacity(0.5)
            Button("Back") {
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
        .environmentObject(TabBarSelection(selectedTab: .constant(.init(iconName: "house", title: "home"))))
}
