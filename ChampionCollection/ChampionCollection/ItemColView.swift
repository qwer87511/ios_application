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
    var body: some View {
        HStack{
            Text(item.name)
        }.frame(height: 80)
    }
}

struct ItemColView_Previews: PreviewProvider {
    static var previews: some View {
        ItemColView(item: Item(name: "test", image:ItemImage(full: "Test", sprite: "sprite")))
    }
}
