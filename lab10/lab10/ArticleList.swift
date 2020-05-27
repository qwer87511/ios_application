import SwiftUI

struct Article: Codable {
    let id: Int
    let title: String
    let excerpt: String
    let commentCount: Int
    let likeCount: Int
    let school: String?
    let media: [picture]
    
    struct picture: Codable {
        let url: URL
    }
}

struct ArticleList: View{
    @State private var posts = [Article]()
    
    func ScanPost(){
        let urlStr = "https://dcard.tw/_api/posts?popular=true"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let post = try? decoder.decode([Article].self, from: data) {
                    self.posts = post
                }
            }.resume()
        }
    }
    
    var body: some View{
        NavigationView{
            List(posts.indices, id: \.self){
                (item) in NavigationLink(destination: ArticleContent(Id: self.posts[item].id)){
                    ArticleRow(article: self.posts[item])
                }
            }
            .navigationBarTitle("文章列表")
            .onAppear{
                self.ScanPost()
            }
        }
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList()
    }
}
