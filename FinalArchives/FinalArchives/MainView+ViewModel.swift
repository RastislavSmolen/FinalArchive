//
//  MainView+ViewModel.swift
//  FinalArchives
//
//  Created by Rastik on 28/05/2023.
//

import Foundation
class ViewModel: ObservableObject {
}
extension MainView {
    @MainActor class ViewModel: ObservableObject {
        @Published var books: BookOject = BookOject(items: [])
    //    @Published var saleInfo: [SalesInfo]
        
        private let networkManager: NetworkManager = NetworkManager()
        
        init(books: BookOject) {
            self.books = books
           // self.saleInfo = saleInfo
        }
        
        func findBook(searchTerm: String) {
            networkManager.fetchBookResults(searchTerm: searchTerm) { result in
                switch result {
                case .success(let books):
                    self.books = books
                    print(self.books.items.count)
                case .failure(let error):
                    print(error)
                }
            }
        }
        func convertToHttps(_ http: String) -> String {
           return "https" + http.dropFirst(4)
        }
    }
}
