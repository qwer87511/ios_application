//
//  SumsListView.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct SumsListView: View {
    @State var sums=[Summoner]()
    @State var colSums : [[Int]] = []
    
    func loadSums(){
        if let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/10.12.1/data/zh_TW/summoner.json"){
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let sums = try? decoder.decode(SummonerData.self, from: data) {
                    DispatchQueue.main.async{
                        self.sums=[]
                        let sorted_items = sums.data.sorted{
                            $0.key<$1.key
                        }
                        for (key,value) in sorted_items{
                            self.sums.append(value)
                        }
                        self.colSums = []
                        _ = (0..<self.sums.count).publisher
                            .collect(2)
                            .collect()
                            .sink(receiveValue: {self.colSums=$0})
                    }
                }
            }.resume()
        }
    }
    var body: some View {
        
        NavigationView{
            ScrollView{
                       VStack{
                           ForEach(0..<self.colSums.count, id:\.self){col in
                               HStack{
                                   ForEach(self.colSums[col], id:\.self) { sum in
                                       SumGrid(sum: self.sums[sum])
                                   }
                               }
                           }
                       }
                   }.navigationBarTitle("Summoner")
        }.onAppear(){
            self.loadSums()
        }
    }
}

//struct SumsListView_Previews: PreviewProvider {
//    static var previews: some View {
////        SumsListView()
//    }
//}
