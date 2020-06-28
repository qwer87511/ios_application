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
                        let sorted_champs = champs.data.sorted{
                            $0.key<$1.key
                        }
                        for (key,value) in sorted_champs{
                            champions.append(value)
                        }
                        self.champions = champions
                        self.displayChampions = champions
                    }
                }
            }.resume()
        }
        
//        champions.append(Champion(name: "Aatrox", title: "the Darkin Blade", blurb: "Once honored defenders of Shurima against the Void, Aatrox and his brethren would eventually become an even greater threat to Runeterra, and were defeated only by cunning mortal sorcery. But after centuries of imprisonment, Aatrox was the first to find...", imageName: "Aatrox.png"))
//
//        champions.append(Champion(name: "Ahri", title: "the Nine-Tailed Fox", blurb: "Innately connected to the latent power of Runeterra, Ahri is a vastaya who can reshape magic into orbs of raw energy. She revels in toying with her prey by manipulating their emotions before devouring their life essence. Despite her predatory nature...", imageName: "Ahri.png"))
//        champions.append(Champion(name: "Akali", title: "the Rogue Assassin", blurb: "Abandoning the Kinkou Order and her title of the Fist of Shadow, Akali now strikes alone, ready to be the deadly weapon her people need. Though she holds onto all she learned from her master Shen, she has pledged to defend Ionia from its enemies, one...", imageName: "Akali.png"))
//
//        champions.append(Champion(name: "Alistar", title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...", imageName: "Alistar.png"))
//        champions.append(Champion(name: "Amumu", title: "the Minotaur", blurb: "Always a mighty warrior with a fearsome reputation, Alistar seeks revenge for the death of his clan at the hands of the Noxian empire. Though he was enslaved and forced into the life of a gladiator, his unbreakable will was what kept him from truly...", imageName: "Amumu.png"))
//        champions.append(Champion(name: "Aatrox", title: "the Darkin Blade", blurb: "Once honored defenders of Shurima against the Void, Aatrox and his brethren would eventually become an even greater threat to Runeterra, and were defeated only by cunning mortal sorcery. But after centuries of imprisonment, Aatrox was the first to find...", imageName: "Aatrox.png"))
//
//        champions.append(Champion(name: "Ahri", title: "the Nine-Tailed Fox", blurb: "Innately connected to the latent power of Runeterra, Ahri is a vastaya who can reshape magic into orbs of raw energy. She revels in toying with her prey by manipulating their emotions before devouring their life essence. Despite her predatory nature...", imageName: "Ahri.png"))
//        champions.append(Champion(name: "Akali", title: "the Rogue Assassin", blurb: "Abandoning the Kinkou Order and her title of the Fist of Shadow, Akali now strikes alone, ready to be the deadly weapon her people need. Though she holds onto all she learned from her master Shen, she has pledged to defend Ionia from its enemies, one...", imageName: "Akali.png"))
//        champions.append(Champion(name: "Alistar", title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...", imageName: "Alistar.png"))
//
//        champions.append(Champion(name: "Amumu", title: "the Minotaur", blurb: "Always a mighty warrior with a fearsome reputation, Alistar seeks revenge for the death of his clan at the hands of the Noxian empire. Though he was enslaved and forced into the life of a gladiator, his unbreakable will was what kept him from truly...", imageName: "Amumu.png"))
//        champions.append(Champion(name: "Aatrox", title: "the Darkin Blade", blurb: "Once honored defenders of Shurima against the Void, Aatrox and his brethren would eventually become an even greater threat to Runeterra, and were defeated only by cunning mortal sorcery. But after centuries of imprisonment, Aatrox was the first to find...", imageName: "Aatrox.png"))
//        champions.append(Champion(name: "Ahri", title: "the Nine-Tailed Fox", blurb: "Innately connected to the latent power of Runeterra, Ahri is a vastaya who can reshape magic into orbs of raw energy. She revels in toying with her prey by manipulating their emotions before devouring their life essence. Despite her predatory nature...", imageName: "Ahri.png"))
//
//        champions.append(Champion(name: "Akali", title: "the Rogue Assassin", blurb: "Abandoning the Kinkou Order and her title of the Fist of Shadow, Akali now strikes alone, ready to be the deadly weapon her people need. Though she holds onto all she learned from her master Shen, she has pledged to defend Ionia from its enemies, one...", imageName: "Akali.png"))
//        champions.append(Champion(name: "Alistar", title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...", imageName: "Alistar.png"))
//        champions.append(Champion(name: "Amumu", title: "the Minotaur", blurb: "Always a mighty warrior with a fearsome reputation, Alistar seeks revenge for the death of his clan at the hands of the Noxian empire. Though he was enslaved and forced into the life of a gladiator, his unbreakable will was what kept him from truly...", imageName: "Amumu.png"))
//
//        champions.append(Champion(name: "Amumu", title: "the Minotaur", blurb: "Always a mighty warrior with a fearsome reputation, Alistar seeks revenge for the death of his clan at the hands of the Noxian empire. Though he was enslaved and forced into the life of a gladiator, his unbreakable will was what kept him from truly...", imageName: "Amumu.png"))
    }
    
    let columnCount = 3
    
    @State var searchText = "" {
        didSet {
            print(2)
            displayChampions.removeAll()
            self.updateDisplayChampions()
        }
    }
    
    @State private var selectorIndex = 0
    
    @State var displayChampions = [Champion]()
    
//    var displayChampions: [Champion] {
//        get {
//            print("get")
//            return self.champions.filter({ searchText == "" ? true : $0.name.contains(searchText) })
//        }
//    }
    
    func updateDisplayChampions() {
        print("update")
        
        displayChampions.removeAll()
        
        var filteredCampions = champions
        
        if searchText != "" {
            filteredCampions = champions.filter({ $0.name.contains(searchText) })
        }
        
        if selectorIndex != 0 {
            filteredCampions = filteredCampions.filter({ $0.tags.contains(tags[selectorIndex]) })
        }
        
        displayChampions = filteredCampions
    }
    
    let tags = ["All", "Assassin", "Fighter", "Mage", "Marksman", "Support", "Tank", "e"]
    
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
                        .pickerStyle(SegmentedPickerStyle())
                        //.padding(.horizontal, 24)
                        .onReceive([self.selectorIndex].publisher.first()) { (value) in

                            self.updateDisplayChampions()
                        }
                        
                        // grid view
//                        ForEach(Array(stride(from: 0, to: self.displayChampions.count, by: self.columnCount)), id: \.self) { index in
//                            HStack {
////                                ForEach(index..<min(index + self.columnCount, self.displayChampions.count)) { championIndex in
////                                    if championIndex < self.displayChampions.count {
////                                        NavigationLink(destination: ChampionDetail(champion: self.displayChampions[championIndex])) {
////                                            ChampionGrid(champion: self.displayChampions[championIndex])
////                                        }
////                                    }
////                                }
//                                ForEach(index..<index + self.columnCount) { championIndex in
//                                    if championIndex < self.displayChampions.count {
//                                        NavigationLink(destination: ChampionDetail(champion: self.displayChampions[championIndex])) {
//                                            ChampionGrid(champion: self.displayChampions[championIndex])
//                                        }
//                                    }
//                                }
//                                Spacer()
//                            }
//                        }
                        ChampionsGridView(columnCount: 3, champions: self.$displayChampions)
                    }
                    .padding()
                    .frame(width: geo.size.width)
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
    @Binding var champions: [Champion]

    var body: some View {
        // grid view
        ForEach(Array(stride(from: 0, to: self.champions.count, by: self.columnCount)), id: \.self) { index in
            HStack {
                ForEach(index..<index + self.columnCount) { championIndex in
                    if championIndex < self.champions.count {
                        NavigationLink(destination: ChampionDetail(champion: self.champions[championIndex])) {
                            ChampionGrid(champion: self.champions[championIndex])
                        }
                    }
                }
                Spacer()
            }
        }
    }
}
////        ForEach(0..<(self.champions.count - 1) / 3 + 1, id: \.self) { rowIndex in
////            HStack {
////                ForEach(rowIndex * 3..<min(rowIndex * 3 + 3, self.champions.count)) { championIndex in
////                    NavigationLink(destination: ChampionDetail(champion: self.champions[championIndex])) {
////                        ChampionGrid(champion: self.champions[championIndex])
////                    }
////                }
////                Spacer()
////            }
////        }
		
struct ChampionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionsListView()
    }
}
