import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<Services> { get }
    func fetchBookResults(searchTerm: String, completion: @escaping (Result<BookOject, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<Services>(plugins: [NetworkLoggerPlugin()])
    
    func fetchBookResults(searchTerm: String, completion: @escaping (Result<BookOject, Error>) -> ()) {
        request(target: .find(searchTerm), completion: completion)
    }
}

private extension NetworkManager {
  
    private func request<T: Decodable>(target: Services, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
