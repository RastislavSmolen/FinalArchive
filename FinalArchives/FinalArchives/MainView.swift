import SwiftUI

struct MainView: View {
    
    @State private var searchTerm: String = ""
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            
            TextField(
                "Find a book",
                text: $searchTerm,
                onCommit: {
                    viewModel.findBook(searchTerm: searchTerm)
                }
            ).padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                .padding([.top, .leading, .trailing], 20.0)
            List(viewModel.books.items, id: \.id) { book in
                BookCell(searchInfo:book.searchInfo,title: book.volumeInfo.title, subtitle: book.volumeInfo.subtitle ?? "", imageUrlString: viewModel.convertToHttps(book.volumeInfo.imageLinks?.smallThumbnail ?? ""), authors: book.volumeInfo.authors, categories: book.volumeInfo.categories ?? [""])
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainView.ViewModel(books: BookOject(items: [Items(kind: "", id: "", volumeInfo: VolumeInfo(title: "Harry Potter and Prisoner of Azkaban", subtitle: "The Man, The God", authors: ["J K Rowling"], imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=raTsvgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api", thumbnail:""), description: "", categories: ["Biography & Autobiography"]), searchInfo: SearchInfo(textSnippet: "Harry is a compelling portrait of one of the most popular members of the royal family, and reveals the inside story of the most intriguing royal romance in a decade."))])))
    }
}
