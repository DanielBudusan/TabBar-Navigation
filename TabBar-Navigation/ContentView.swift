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
// test
struct ContentView: View {
    @State private var previousSelectedTab: TabBarItem = .init(iconName: "house", title: "home")
    @State private var selectedTab: TabBarItem = .init(iconName: "house", title: "home")
    
    var body: some View {
        CustomTabView(selectedTab: $selectedTab, previousSelectedTab: $previousSelectedTab) {
            HomeView()
                .tabBarItem(iconName: "house.fill", title: "home")
            SearchView()
                .tabBarItem(iconName: "magnifyingglass", title: "search")
            HistoryView()
                .tabBarItem(iconName: "clock", title: "history")
            ProfileView()
                .tabBarItem(iconName: "person.fill", title: "profile")
        }
        .ignoresSafeArea()
    }
}


struct HomeView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.blue.opacity(0.5)
                VStack {
                    Text("Home")
                        .font(.title)
                    NavigationLink("Push next" , value: 1)
                        .buttonStyle(.bordered)
                }
            }
            .ignoresSafeArea(.all)
            .navigationDestination(for: Int.self) { selection in
                DetailView(path: $path)
                    .navigationBarBackButtonHidden(true)
                    .tabBarHidden(true)
            }
        }
    }
}

struct SearchView: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.5)
            Text("Search")
                .font(.title)
        }
    }
}

struct HistoryView: View {
    @State private var editMode = false
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.5)
            VStack {
                Text("History")
                    .font(.title)
                if editMode {
                    Text("Edit Mode on")
                }
                Button {
                    withAnimation {
                        editMode.toggle()
                    }
                } label: {
                    if editMode {
                        Text("Save")
                    } else {
                        Text("Edit")
                    }
                }
                .buttonStyle(.bordered)
            }
            
            if editMode {
                TabBarView(tabs: [
                    TabBarItem(iconName: "arrowshape.backward.fill", title: "back", action: { editMode.toggle() }),
                    TabBarItem(iconName: "trash", title: "delete", color: .red),
                    TabBarItem(iconName: "star.slash", title: "unfavorite"),
                    TabBarItem(iconName: "star.fill", title: "favorite", color: .yellow)
                ])
                .transition(.move(edge: .leading))
            }
            
        }
        .tabBarHidden(editMode ? true : false)
        
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.green.opacity(0.5)
            Text("Profile")
                .font(.title)
        }
    }
}

struct DetailView: View {
    @Binding var path: NavigationPath
    
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.5)
            VStack {
                Button("Back") {
                    path = NavigationPath()
                }
                .buttonStyle(.bordered)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
        .environmentObject(TabBarSelection(selectedTab: .constant(.init(iconName: "house", title: "home")), previousSelectedTab: .constant(.init(iconName: "house", title: "home"))))
}
