import Foundation
import Moya

enum Services {
    case find(_ book: String)
}

extension Services: TargetType {
    
    var method: Moya.Method {
        switch self {
        case .find:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .find(book):
            return .requestParameters(parameters: ["q": book,"key": Constants.token.rawValue,"maxResults": "40"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var baseURL: URL { URL(string: "https://www.googleapis.com/books/v1/volumes")! }
    
    
    var path: String {
        switch self {
        case .find:
            return ""
        }
    }
    
}
