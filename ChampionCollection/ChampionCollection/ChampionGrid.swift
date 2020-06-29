//
//  ChampionGrid.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/6.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ChampionGridRow: View {
    let columnCount = 3
    let champions: [Champion]
    
    var body: some View {
        HStack {
            ForEach(0..<self.champions.count, id: \.self) { i in
                NavigationLink(destination: ChampionDetail(champion: self.champions[i])) {
                    ChampionGrid(champion: self.champions[i])
                }
            }
        }
    }
}

struct ChampionGrid: View {
    
    let champion: Champion
    @State var image: Image = Image(systemName: "person")
    @State var isLoaded = false
    func loadImage() {
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.10.3216176/img/champion/\(champion.image.full)")!) {
            (data, response , error) in
            if let data = data, let image = UIImage(data: data) {
                self.image = Image(uiImage: image)
                self.isLoaded = true
            }
            else {
                print("load fail")
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            image
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width:80, height:80)
                .cornerRadius(12)
                //.frame(alignment: .top)
                //.clipped()
                .padding()
            Text(champion.name)
                .foregroundColor(Color.gray)
                .font(.subheadline).lineLimit(1)
                .frame(width:80)
            }
    //.fixedSize()
        .onAppear() {
            if !self.isLoaded {
                self.loadImage()
            }
        }
    }
}

struct ChampionGrid_Previews: PreviewProvider {
    static var previews: some View {
        ChampionGrid(champion: Champion(name: "Alistar", id: "Alistar",title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...",image: APIImg(full: "Alistar.png",sprite: "champion0.png"), tags: ["Fighter","Tank"]))
    }
}
