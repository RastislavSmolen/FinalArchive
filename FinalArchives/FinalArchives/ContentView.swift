import SwiftUI
import CoreData
import Moya

struct ContentView: View {

    @State private var searchTerm: String = ""

    private let networkManager: NetworkManager = NetworkManager()
    @State var books: Books = Books(kind: "", totalItems: 0, items: [BookInfo(kind: "", selfLink: "", id: "", volumeInfo: CreatorsInfo(title: "", authors: [""]))])
    
    var body: some View {
        
        VStack {
            TextField("Find a book", text: $searchTerm)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                .padding([.top, .leading, .trailing], 20.0)
                .onSubmit {
                    findBook(searchTerm: searchTerm)
                }
            Spacer()
            List(books.items, id: \.id) {
                Text($0.volumeInfo.title)
            }
        }
    }
    
    func findBook(searchTerm: String) {
        networkManager.fetchBookResults(searchTerm: searchTerm) { result in
            switch result {
            case .success(let book):
                books = book
            case .failure(let error):
                print(error)
            }
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
