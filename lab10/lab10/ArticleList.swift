//
//  ArticleList.swift
//  lab10
//
//  Created by 黃俊維 on 2020/5/19.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ArticleList: View {
    
//    var articles = [
//        Article(id: 1, title: "2", excerpt: "213", anonymousSchool: false, anonymousDepartment: false, createdAt: DateComponents(calendar: Calendar.current, year: 2020, month: 5, day: 20).date!, commentCount: 10, likeCount: 20, school: "NTU")
//    ]
    @State private var articles = [Article]()
    
    init() {
        //let apiUrlString = "https://www.dcard.tw/_api/posts?popular=true"
        //
        //        if let apiUrl = URL(string: apiUrlString) {
        //            URLSession.shared.dataTask(with: apiUrl) { (data, responde, error) in
        //                if let data = data, let articlesResult = try?JSONDecoder().decode([Article].self, from: data) {
        //                    self.articles = articlesResult
        //                    print(articlesResult)
        //                }
        //                else {
        //                    print(error.debugDescription)
        //                }
        //            }.resume()
        //        }
         //       let urlStr = "https://dcard.tw/_api/posts"
//                if let url = URL(string: apiUrlString) {
//                    URLSession.shared.dataTask(with: url) { (data, response, error) in
//                        let decoder = JSONDecoder()
//                        if let data = data {
//                            do {
//                                let articles = try decoder.decode([Article].self, from: data)
//
//                                self.articles = articles
//                            } catch {
//                                print(error)
//                            }
//                        }
//                    }.resume()
//                }
//        articles = [Article]()
    }
    
    var body: some View {
        let apiUrlString = "https://www.dcard.tw/_api/posts?popular=true"
        
        if let apiUrl = URL(string: apiUrlString) {
            URLSession.shared.dataTask(with: apiUrl) { (data, responde, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    if let articlesResult = try?decoder.decode([Article].self, from: data) {
                        self.articles = articlesResult
                        print(articlesResult)
                        print(1)
                    }
                    else {
                        print(error.debugDescription)
                        print(2)
                    }
                }
                else {
                    print(error.debugDescription)
                    print(3)
                }
            }.resume()
        }
        
        return List(0 ..< articles.count) { (i) in
            NavigationLink(destination: ArticleView()) {
                ArticleRow(article: self.articles[i])
            }
        }
    }
}

//struct ArticleList_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleList()
//    }
//}
