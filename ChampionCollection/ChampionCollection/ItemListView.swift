//
//  ItemListView.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ItemListView: View {
    @State var items = [Item]()
    
    func loadItems() {
        let urlStr = "https://ddragon.leagueoflegends.com/cdn/10.10.3216176/data/zh_TW/item.json"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let items = try? decoder.decode(ItemData.self, from: data) {
                    DispatchQueue.main.async{
                        let sorted_items = items.data.sorted{
                            $0.key<$1.key
                        }
                        for (key,value) in sorted_items{
                            self.items.append(value)
                        }
                    }
                    
                }
            }.resume()
        }
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(self.items, id: \.name){item in
                    ItemColView(item: item)
                }
            }.navigationBarTitle("Items")
        }.onAppear(){
            self.loadItems()
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
