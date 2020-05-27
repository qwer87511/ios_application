import SwiftUI

struct Content: Codable {
    let title: String
    let content: String
    let commentCount: Int
    let likeCount: Int
}

struct ArticleContent: View{
    @State private var article:Content = Content(title: "標題", content: "內文", commentCount: 30678, likeCount: 78778)
    let Id:Int
    
    func ScanPost(id: Int){
        let urlStr = "https://dcard.tw/_api/posts/\(id)"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let post = try? decoder.decode(Content.self, from: data) {
                    self.article = post
                }
            }.resume()
        }
    }
    
    var body: some View{
        ScrollView(.vertical){
            VStack(alignment: .leading){
                Text(article.title)
                    .font(.title)
                Text(article.content)
                HStack{
                    Text("Like: \(article.likeCount)")
                        .font(.footnote)
                    Text("留言: \(article.commentCount)")
                        .font(.footnote)
                    Spacer()
                }
                Spacer()
            }
            .onAppear{
                self.ScanPost(id: self.Id)
            }
        }
    }
}

struct ArticleContent_Previews: PreviewProvider {
    static var previews: some View {
        ArticleContent(Id: 265954)
    }
}
