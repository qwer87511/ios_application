//
//  ChampionsListView.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/5.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ChampionsListView: View {
    
    @State var champions = [Champion]()
    
    func loadChampions() {
        var champions = [Champion]()
        let urlStr = "https://ddragon.leagueoflegends.com/cdn/10.10.3216176/data/en_US/champion.json"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let champs = try? decoder.decode(Champions.self, from: data) {
                    DispatchQueue.main.async {
                        let sorted_champs = champs.data.sorted {
                            $0.key<$1.key
                        }
                        for (key,value) in sorted_champs {
                            champions.append(value)
                        }
                        self.champions = champions
                        self.displayChampions = champions
                    }
                }
            }.resume()
        }
        

    }
    
    let columnCount = 3
    
    @State var searchText = "" {
        didSet {
            self.updateDisplayChampions()
        }
    }
    
    @State private var selectorIndex = 0
    
    @State var displayChampions = [Champion]()
    
    func updateDisplayChampions() {
        var filteredCampions = champions
        
        if searchText != "" {
            filteredCampions = champions.filter({ $0.name.contains(searchText) })
        }
        
        if selectorIndex != 0 {
            filteredCampions = filteredCampions.filter({ $0.tags.contains(tags[selectorIndex]) })
        }
        
        displayChampions = filteredCampions
    }
    
    let tags = ["Assassin", "Fighter", "Mage", "Support", "Tank"]
    
    var body: some View {
        
        GeometryReader { geo in
            NavigationView {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading) {
                        
                        // search  bar
                        SearchBar(text: Binding<String>(
                            get: { self.searchText },
                            set: {
                                self.searchText = $0
                        }))
                        
                        // picker
                        Picker("Numbers", selection: self.$selectorIndex) {
                            ForEach(0 ..< self.tags.count) { i in
                                Text(self.tags[i]).tag(i)
                            }
                        }
                        .onAppear(){
                            self.updateDisplayChampions()
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()
                    ChampionsGridView(columnCount: 3, champions: self.displayChampions, tag:self.tags[self.selectorIndex])
                }
                .navigationBarTitle("Champions")
            }
        }
        .onAppear() {
            if self.champions.isEmpty {
                self.loadChampions()
            }
        }
    }
}

class ObservableChampion: ObservableObject {
    @Published var champions = [Champion]()
}

struct ChampionsGridView: View {

    let columnCount: Int
    var champions: [Champion]
    var image = Image(systemName: "person")
    @State var images = [String:Image]()
    init(columnCount:Int, champions:[Champion], tag:String) {
        if tag != "ALL"{
            self.champions = champions.filter({
                $0.tags.contains(tag)
            })
        }else{
            self.champions=champions
        }
        self.columnCount=columnCount
    }
    var body: some View {
        VStack {
            ForEach(0..<getColumns(champions.count), id:\.self) { i in
                ChampionGridRow(champions: Array(self.champions[self.getStart(i)..<self.getEnd(i, count: self.champions.count)]))
            }
        }.onAppear(){
            
        }
    }
    func imageBuilder(image:Image?) -> Image{
        if image == nil{
            return Image(systemName: "person")
        }
        return image!
    }
    func getColumns(_ i: Int) -> Int {
        return (i - 1) / 3 + 1
    }
    func getStart(_ i: Int) -> Int {
        return i * 3
    }
    func getEnd(_ i: Int, count: Int) -> Int {
        return min((i + 1) * 3, count)
    }
}
		
struct ChampionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionsListView()
    }
}
