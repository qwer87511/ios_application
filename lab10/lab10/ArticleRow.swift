//
//  ArticleRow.swift
//  lab10
//
//  Created by 黃俊維 on 2020/5/19.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        HStack {
            VStack {
                Text(article.school!)
                Text(article.title)
                Text(article.excerpt)
                Text("likes: \(article.likeCount) comments: \(article.commentCount)")
            }
        }
    }
}

//struct ArticleRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleRow()
//    }
//}
