//
//  RunesListView.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct RunesListView: View {
    @State var runesData=[RuneSet]()
    @State var colrunes : [[Int]] = []
    @State var isLoaded = false
    
    func loadRunes(){
        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/data/zh_TW/runesReforged.json"){
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data{
                    do{
                        let runes = try decoder.decode([RuneSet].self, from: data)
                        self.runesData = runes
                        self.isLoaded = true
                    } catch{
                    }
                }
                
            }.resume()
        }
    }
    var body: some View {
        
        NavigationView{
            List{
                ForEach(self.runesData, id: \.id){rune in
                    VStack {
                        RunesRow(runes: rune)
                    }
                }
            }.navigationBarTitle("Runes")
        }.onAppear(){
            if !self.isLoaded {
                self.loadRunes()
            }
        }
    }
}

struct RunesListView_Previews: PreviewProvider {
    static var previews: some View {
        RunesListView()
    }
}
