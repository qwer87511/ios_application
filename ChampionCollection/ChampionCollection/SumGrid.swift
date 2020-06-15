//
//  SumGrid.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct SumGrid: View {
    var sum:Summoner
    @State var picture: Image = Image(systemName: "person")
    
    func loadImage() {
        URLSession.shared.dataTask(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/img/spell/\(sum.image.full)")!) {
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
        VStack{
            picture
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width:80, height:80)
            //.frame(alignment: .top)
            //.clipped()
            .padding()
            Text(sum.name)
        }.onAppear(){
            self.loadImage()
        }
    }
}
//
//struct SumGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        SumGrid()
//    }
//}
