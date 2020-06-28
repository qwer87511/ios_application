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
    @State var championInfo: ChampionInfo?
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
            if let data = data, let c = try? decoder.decode(ChampionInfoData.self, from: data) {
                DispatchQueue.main.async {
                    self.championInfo = c.data[self.champion.name]
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
            //Section {
                if selectorIndex == 0 {
                    ProfileView(text: self.champion.blurb)
                }
                else if selectorIndex == 1 {
                    SkillsView(champion: self.championInfo)
                }
                else if selectorIndex == 2 {
                    PropsView(recommends: self.championInfo!.recommended)
                }
                else if selectorIndex == 3 {
                    SkinsView(skinImage: $championImage, champion: self.champion,
                              skins: self.championInfo!.skins)
                }
            //}
        }
        .onAppear() {
            if !self.isLoadedChampions {
                self.loadChampionData()
            }
            if !self.isLoadedImage {
                self.loadImage()
            }
        }.disabled(!self.isLoadedChampions)
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
    let champion: ChampionInfo?
    @State var isLoadedImages = false
    
    func loadImage() {

        for i in 0..<4 {
            URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/img/spell/\(self.champion!.spells[i].image.full)")!) {
                (data, response , error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async{
                        self.skillsImage[i] = Image(uiImage: image)
                    }
                    self.isLoadedImages = true
                }
                else {
                    print("load skill api fail")
                }
            }.resume()
        }
    }
    
    var body: some View {
        VStack{
            List(0..<self.champion!.spells.count, id:\.self){index in
                HStack{
                    self.skillsImage[index].resizable().scaledToFit().clipped()
                        .padding().frame(width:100,height:100)
                    Text("\(self.qwer[index]) \(self.champion!.spells[index].name)")
                }
            }
        }.onAppear(){
            if !self.isLoadedImages {
                self.loadImage()
            }
        }
    }
}

struct PropsView: View {
    var recommend:Recommend
    @State var images = [String:[String:Image]]()
    init(recommends:[Recommend]) {
        let index = recommends.firstIndex{ (r) -> Bool in
            return r.mode == "CLASSIC"
        }!
        self.recommend = recommends[index]
    }
    func loadImages(){
        for block in self.recommend.blocks{
            for item in block.items{
                URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/img/item/\(item.id).png")!) {
                    (data, response , error) in
                    if let data = data, let image = UIImage(data: data) {
                        self.images[block.type]?[item.id] = Image(uiImage: image)
                    }
                    else {
                        print("load skill api fail")
                    }
                }.resume()
            }
        }
    }
    func initImages(){
        for block in self.recommend.blocks{
            for item in block.items{
                if self.images[block.type] != nil{
                    self.images[block.type]?[item.id] = Image(systemName: "person")
                }else{
                    self.images[block.type] = [String:Image]()
                    self.images[block.type]?[item.id] = Image(systemName: "person")
                }
            }
        }
    }
    func checkImage(images: [Image]) -> Bool{
        return images != nil
    }
    var body: some View {
            List{
            ForEach(0..<self.recommend.blocks.count){index in
                
                    PropRow(block: self.recommend.blocks[index], images: self.images[self.recommend.blocks[index].type] ?? [:])
                }
            }.onAppear(){
                self.initImages()
                self.loadImages()
        }.padding()
        
    }
    struct PropRow:View {
        var block:Block
        var images:[String:Image]
        var body: some View{
            ScrollView(.horizontal){
            HStack{
                Text(block.type).frame(width:120)
                    ForEach(0..<block.items.count){index in
                        PropImage(item: self.block.items[index])
                    }
                }
            }
        }
    }
    struct PropImage:View{
        @State var image:Image=Image(systemName: "person")
        var item:ChampionItems
        func loadImg(){
            URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/img/item/\(self.item.id).png")!) {
                (data, response , error) in
                if let data = data, let image = UIImage(data: data) {
                    self.image = Image(uiImage: image)
                }
                else {
                    print("load skill api fail")
                }
            }.resume()
        }
        var body:some View{
            image.frame(width:100, height:100).onAppear(){
                self.loadImg()
            }
        }
    }
    
}

struct SkinsView: View {
    @Binding var skinImage: Image// = Image(systemName: "person")
    let champion: Champion
    @State var isloadedImages = false
    let skins: [Skin]
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
        ScrollView(.horizontal){
            HStack {
                ForEach(self.skins, id:\.id){skin in
                    ImagePoster(name: self.champion.name, skin: skin)
                }
                }.padding()
            .onAppear() {
                
                if !self.isloadedImages {
                    self.loadImage(0)
                }
            }
        }
    }
    struct ImagePoster: View{
        @State var image = Image(systemName: "person")
        var name : String
        var skin:Skin
        func loadImg(){
            URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(self.name)_\(self.skin.num).jpg")!) {
                (data, response , error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = Image(uiImage: image)
                    }
                }
                else {
                    print("load skin fail")
                }
            }.resume()
        }
        var body:some View{
            image
                .resizable()
                .frame(width:180, height: 250)
                .padding()
            .cornerRadius(CGFloat(60), antialiased: false)
                .onAppear(){
                self.loadImg()
            }
        }
    }
}


//struct ChampionDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ChampionDetail(champion: Champion(name: "Alistar", id: "Alistar",title: "the Sad Mummy", blurb: "Legend claims that Amumu is a lonely and melancholy soul from ancient Shurima, roaming the world in search of a friend. Doomed by an ancient curse to remain alone forever, his touch is death, his affection ruin. Those who claim to have seen him describe...",image: Img(full: "Alistar.png",sprite: "champion0.png")))
//    }
//}
