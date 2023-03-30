//
//  ContentView.swift
//  Ecommerce TechProducts
//
//  Created by Diego Monteagudo Diaz on 27/03/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage:"homekit")
                }
            
            Text("Categories")
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }
            
            Text("WishList")
                .tabItem {
                    Label("WishList", systemImage: "suit.heart.fill")
                }
                .badge(2)
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
