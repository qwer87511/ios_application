//
//  ChampionGrid.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/6.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ChampionGrid: View {
    
    let champion: Champion
    @State var picture: Image = Image(systemName: "person")
    
    func loadImage() {
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.10.3216176/img/champion/\(champion.imageName)")!) {
            (data, response , error) in
            if let data = data, let image = UIImage(data: data) {
                self.picture = Image(uiImage: image)
            }
            else {
                print("load fail")
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            picture
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                //.frame(width:80, height:80)
                //.frame(alignment: .top)
                //.clipped()
                .padding()
            Text(champion.name)
                .foregroundColor(Color.gray)
                .font(.title)
        }
        .onAppear() {
            self.loadImage()
        }
    }
}

struct ChampionGrid_Previews: PreviewProvider {
    static var previews: some View {
        ChampionGrid(champion: Champion(name: "Alistar", title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...", imageName: "Alistar.png"))
    }
}
