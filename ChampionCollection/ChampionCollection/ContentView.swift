//
//  ContentView.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/5.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //ChampionsListView()
        TabView {
            ChampionsListView()
                .tabItem() {
                    Image(systemName: "person.3")
                    Text("Champions")
            }.tag(1)

            ItemListView()
                .tabItem() {
                    Image(systemName: "archivebox")
                    Text("Props")
            }.tag(2)

            ChampionsListView()
                .tabItem() {
                    Image(systemName: "moon.circle.fill")
                    Text("Runes")
            }.tag(3)

            SumsListView()
                .tabItem() {
                    Image(systemName: "bolt.circle.fill")
                    Text("Sum's S kills")
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
