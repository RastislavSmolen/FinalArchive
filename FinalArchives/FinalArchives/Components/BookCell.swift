import SwiftUI
import CachedAsyncImage

struct BookCell: View {
    let searchInfo: SearchInfo?
    let title: String
    let subtitle: String
    let imageUrlString: String
    let authors: [String]
    let categories: [String]
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
            ForEach(authors, id: \.count) { author in
                Text(author)
                    .font(.footnote)
                    .bold()
            }
            HStack {
                CachedAsyncImage(url: URL(string: imageUrlString))
                    .padding()
                VStack () {
           
                    if let searchInfo = searchInfo {
                        Text(searchInfo.textSnippet)
                            .frame(height: 110)
                            .font(.footnote)
                            .padding(.trailing, 20)
                            .padding(.bottom,65)
                    }
                    ForEach(categories, id: \.count) { categorie in
                        Text("Type: " + categorie)
                            .font(.caption)
                            .bold()
                    }
                    .frame(width: 230, height: 10, alignment: .leading)

                }
            }
        }
        
    }
}

struct BookCell_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainView.ViewModel(books: BookOject(items: [Items(kind: "", id: "", volumeInfo: VolumeInfo(title: "Harry Potter and Prisoner of Azkaban", subtitle: "The Man, The God", authors: ["J K Rowling"], imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=raTsvgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api", thumbnail:""), description: "", categories: ["Biography & Autobiography"]), searchInfo: SearchInfo(textSnippet: "Harry is a compelling portrait of one of the most popular members of the royal family, and reveals the inside story of the most intriguing royal romance in a decade."))])))
    }
}
