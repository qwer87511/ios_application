import SwiftUI

struct ArticleRow: View{
    let article:Article
    @State private var picture:Image = Image("empty")
    
    func getImage(){
        if article.media.count > 0{
            URLSession.shared.dataTask(with: article.media[0].url) { (data, response , error) in
                if let data = data, let image = UIImage(data: data){
                    self.picture = Image(uiImage: image)
                }
            }.resume()
        }
    }
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("\(article.school ?? "匿名")")
                    .foregroundColor(Color.gray)
                Text(article.title)
                    .font(.title)
                Text(article.excerpt)
                    .foregroundColor(Color.gray)
                HStack{
                    Text("like: \(article.likeCount)")
                    Text("回應: \(article.commentCount)")
                    Spacer()
                }
            }
            .padding()
            picture
                .resizable()
                .scaledToFill()
                .frame(width:90, height:150)
                .clipped()
                .padding()
            Spacer()
        }
        .onAppear{
            self.getImage()
        }
    }
}
