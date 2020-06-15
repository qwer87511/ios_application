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
                            self.champions.append(value)
                        }
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
    	
    var body: some View {
        
        //GeometryReader { geo in
        
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(Array(stride(from: 0, to: self.champions.count, by: self.columnCount)), id: \.self) { index in
                            HStack {
                                ForEach(index..<min(index + self.columnCount, self.champions.count)) { championIndex in
                                    NavigationLink(destination: ChampionDetail(champion: self.champions[championIndex])) {
                                        ChampionGrid(champion: self.champions[championIndex])
                                    }
                                }
                            }
                            
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Champions")
            }
            .onAppear() {
                if self.champions.count == 0 {
                    self.loadChampions()
                }
            }
        //}
    }
}
		
struct ChampionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionsListView()
    }
}
