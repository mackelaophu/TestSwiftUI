//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView().tabItem{
                Label("Home", systemImage: "person")
            }
            StoryView().tabItem{
                Label("Story", systemImage: "book")
            }
            FavoriteView().tabItem{
                Label("Favorites", systemImage: "star")
            }
            FunFactView().tabItem{
                Label("FunFact", systemImage: "hand.thumbsup")
            }
            ListPageView().tabItem{
                Label("More", systemImage: "books.vertical.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
