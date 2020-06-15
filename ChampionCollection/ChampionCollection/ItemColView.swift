//
//  ItemColView.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ItemColView: View {
    var item:Item
    @State var picture: Image = Image(systemName: "person")
    func loadItem(){
        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/img/item/\(item.image.full)"){
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data, let image = UIImage(data: data) {
                   DispatchQueue.main.async{
                        self.picture = Image(uiImage: image)
                    }
                }
                else {
                    print("load fail")
                }
            }.resume()
        }
    }
    var body: some View {
        HStack{
            picture
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width:80, height:80)
            Text(item.name)
        }.frame(height: 80).onAppear(){
            self.loadItem()
        }
    }
}

struct ItemColView_Previews: PreviewProvider {
    static var previews: some View {
        ItemColView(item: Item(name: "test", image:ItemImage(full: "Test", sprite: "sprite")))
    }
}
