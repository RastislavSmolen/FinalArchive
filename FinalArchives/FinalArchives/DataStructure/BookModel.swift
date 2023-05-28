import Foundation

struct Books: Decodable {
    let kind: String
    let totalItems: Int
    let items: [BookInfo]
}

struct BookInfo: Decodable {
    let kind: String
    let selfLink: String
    let id: String
    let volumeInfo: CreatorsInfo
}

struct CreatorsInfo: Decodable {
    let title: String
    let authors: [String]
}
