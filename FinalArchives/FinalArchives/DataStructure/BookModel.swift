import Foundation

struct BookOject: Decodable {
    let items: [Items]
}

struct Items: Decodable {
    let kind: String
    let id: String
    let volumeInfo: VolumeInfo
    let searchInfo: SearchInfo
}
struct VolumeInfo: Decodable {
    let title: String
    let subtitle: String?
    let authors: [String]
    let imageLinks: ImageLinks
    let description: String
}
struct SearchInfo: Decodable {
    let textSnippet: String
}
struct ImageLinks: Decodable {
    let smallThumbnail: String
    let thumbnail: String
}
struct SalesInfo: Decodable {
    let retailPrice: RetailPrice
}
struct RetailPrice: Decodable {
    let amount: String
    let currencyCode: String
}
