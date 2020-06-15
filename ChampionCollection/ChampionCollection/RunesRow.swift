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
    @State var count = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text(runes.name).font(.title)
            
                ForEach(0..<count, id: \.self){index in
                    HStack{
                        ForEach(self.runes.slots[index].runes, id: \.self){rune in
                            Text(rune.name)
                        }
                    }

                }
            
        }.onAppear(){
            self.count = self.runes.slots.count
        }
    }
}

//struct RunesRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RunesRow()
//    }
//}
