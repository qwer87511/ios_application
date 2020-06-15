//
//  RunesRow.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct RunesRow: View {
    let runes:RuneSet
    @State var picture: Image = Image(systemName: "person")
    @State var count = 0
    
    func loadImage() {
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/\(runes.icon)")!) {
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
        VStack(alignment: .leading){
            HStack{
                picture
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width:40, height:40)
                //.frame(alignment: .top)
                //.clipped()
                .padding()
                Text(runes.name).font(.title)
            }
            
                ForEach(0..<count, id: \.self){index in
                    HStack{
                        ForEach(self.runes.slots[index].runes, id: \.self){rune in
                            Text(rune.name)
                        }
                    }

                }
            
        }.onAppear(){
            self.count = self.runes.slots.count
            self.loadImage()
        }
    }
}

//struct RunesRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RunesRow()
//    }
//}
