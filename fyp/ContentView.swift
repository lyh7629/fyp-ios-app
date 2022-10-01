//
//  ContentView.swift
//  fyp
//
//  Created by Yat Hin Leung on 9/9/2022.
//

import SwiftUI

struct ContentView: View {
//        init() {
//            UITabBar.appearance().barTintColor = UIColor.lightGray
//            }
    
    @State private var selection = 0
    
    var body: some View {
        TabView {
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(0)
            
            HomeView().tabItem {
                Image(systemName: "star.fill")
                Text("Favorite")
            }
            .tag(1)
            
            BusView().tabItem {
                Image(systemName: "bus.doubledecker.fill")
                Text("Bus")
            }
            .tag(2)
            
            SettingView().tabItem {
                Image(systemName: "gear")
                Text("Setting")
            }
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
