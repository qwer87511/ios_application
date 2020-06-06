//
//  ChampionDetail.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/6.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ChampionDetail: View {
    let champion: Champion
    
    @State var championImage: Image = Image(systemName: "person")
    
    func loadImage() {
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champion.name)_0.jpg")!) {
            (data, response , error) in
            if let data = data, let image = UIImage(data: data) {
                self.championImage = Image(uiImage: image)
            }
            else {
                print("load fail")
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            ZStack {
                championImage
                    .resizable()
                    .scaledToFill()
                    //.frame(width:80, height:80)
                    .clipped()
                    .padding()
                Text(champion.name)
                .foregroundColor(.gray)
                .font(Font.system(size: 50, weight:.heavy))
                .frame(width: 300, height: 300, alignment: .center)
            }
            .frame(alignment: .top)
            
            Text("other").frame(height: 300)
            
            // segment control
        }
        .onAppear() {
            self.loadImage()
        }
    }
}

struct ChampionDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChampionDetail(champion: Champion(name: "Alistar", title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...", imageName: "Alistar.png"))
    }
}
