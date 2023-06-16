import SwiftUI
import CachedAsyncImage

struct BookCell: View {
    let title: String
    let subtitle: String
    let imageUrlString: String
    let authors: [String]
    let textSnippet: String
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
            ForEach(authors, id: \.count) { author in
                Text(author)
                    .font(.footnote)
            }
            HStack {
                CachedAsyncImage(url: URL(string: imageUrlString))
                    .padding()
                VStack () {
                    Text(textSnippet)
                        .frame(height: 110)
                    Text("More Information ")
                    Text("More Information ")
                    Text("More Information ")
                }
            }
        }
        
    }
}
