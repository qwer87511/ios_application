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
    @State var championData: ChampionData?
    @State var championImage: Image = Image(systemName: "person")
    @State var isLoadedChampions = false
    @State var isLoadedImage = false
    
    func loadImage() {
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champion.id)_0.jpg")!) {
            (data, response , error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.championImage = Image(uiImage: image)
                }
                self.isLoadedImage = true
            }
            else {
                print("load champion image fail")
            }
        }.resume()
    }
    
    func loadChampionData() {
        
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/data/en_US/champion/\(champion.id).json")!) {
            (data, response , error) in
            let decoder = JSONDecoder()
            if let data = data, let c = try? decoder.decode(ChampionsData.self, from: data) {
                DispatchQueue.main.async {
                    self.championData = c.data[self.champion.name]
                }
                self.isLoadedChampions = true
            }
            else {
                print("load champion data detail fail")
            }
        }.resume()
    }
    
    @State private var selectorIndex = 0
    @State private var numbers = ["One","Two","Three"]

    var body: some View {
        VStack {
            GeometryReader { metrics in
                ZStack {
                    self.championImage
                        .resizable()
                        .scaledToFit()
                        //.frame(width:80, height:80)
                        .clipped()
                        .padding()
                    Text(self.champion.name)
                        .foregroundColor(.gray)
                        .font(Font.system(size: 50, weight:.heavy))
                        .frame(width: 300, height: 300, alignment: .center)
                }
                .frame(height: metrics.size.height * 0.4, alignment: .center)
            }
                
            Picker("Numbers", selection: self.$selectorIndex) {
                
//                    ForEach(1 ..< self.numbers.count) { index in
//                        Text(self.numbers[index]).tag(index)
//                    }
                Text("Profile").tag(0)
                Text("Skills").tag(1)
                Text("Props").tag(2)
                Text("Skins").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 24)
            
            if selectorIndex == 0 {
                ProfileView(text: self.champion.blurb)
            }
            else if selectorIndex == 1 {
                SkillsView(champion: self.championData)
            }
            else if selectorIndex == 2 {
                //PropsView()
                ItemListView()
            }
            else if selectorIndex == 3 {
                SkinsView(skinImage: $championImage, champion: self.champion)
            }
        }
        .onAppear() {
            if !self.isLoadedChampions {
                self.loadChampionData()
            }
            if !self.isLoadedImage {
                self.loadImage()
            }
        }
    }
}

struct ProfileView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .font(Font.system(size: 20, weight:.heavy))
            .frame(width: 300, height: 300, alignment: .center)
    }
}

struct SkillsView: View {
    @State var skillsImage = [
        Image(systemName: "person"),Image(systemName: "person"),Image(systemName: "person"),Image(systemName: "person")
    ]
    let qwer = ["Q", "W", "E", "R"]
//    var skillName: String
//    var skillDescription: String
    var champion: ChampionData?
    @State var isLoadedImages = false
    
    func loadImage() {
//        if let data = champion {
//            for i in 0..<4 {
//                URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/img/spell/\(data.spells[i].image.full)")!) {
//                    (data, response , error) in
//                    if let data = data, let image = UIImage(data: data) {
//                        DispatchQueue.main.async{
//                            self.skillsImage[i] = Image(uiImage: image)
//                        }
//                        self.isLoadedImages = true
//                    }
//                    else {
//                        print("load skill api fail")
//                    }
//                }.resume()
//            }
//        }
    }
    
    var body: some View {
        VStack {
            List(0..<4) { i in
                HStack {
                    self.skillsImage[i]
                        .resizable()
                        .scaledToFill()
                        //.frame(width:80, height:80)
                        .clipped()
                        .padding()
                    VStack {
                        Text("\(self.champion?.name ?? "") \(self.qwer[i])")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 50, weight:.heavy))
                            .frame(width: 300, height: 300, alignment: .center)
                        Text("\(self.champion?.name ?? "") \(self.qwer[i]) description")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 30, weight:.heavy))
                            .frame(width: 300, height: 300, alignment: .center)
                    }
                }
            }
            .onAppear() {
                if !self.isLoadedImages {
                    self.loadImage()
                }
            }
        }
    }
}

struct PropsView: View {
    var body: some View {
        List {
            Text("0")
            Text("1")
        }
    }
}

struct SkinsView: View {
    @Binding var skinImage: Image// = Image(systemName: "person")
    let champion: Champion
    @State var isloadedImages = false
    func loadImage(_ i: Int) {
        
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champion.id)_\(i).jpg")!) {
            (data, response , error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.skinImage = Image(uiImage: image)
                }
            }
            else {
                print("load skin fail")
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            List(0..<2) { (i) in
                Text("skin \(i)")
                .contentShape(Rectangle())
                .onTapGesture {
                    self.loadImage(i)
                }
            }
        }
        .onAppear() {
            
            if !self.isloadedImages {
                self.loadImage(0)
            }
        }
    }
}


//struct ChampionDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ChampionDetail(champion: Champion(name: "Alistar", id: "Alistar",title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...",image: Img(full: "Alistar.png",sprite: "champion0.png")))
//    }
//}
