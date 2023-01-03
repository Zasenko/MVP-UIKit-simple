//
//  NetworkService.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(complition: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getComments(complition: @escaping (Result<[Comment]?, Error>) -> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error, data != nil {
                complition(.failure(error))
                return
            }
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data!)
                complition(.success(comments))
            } catch {
                complition(.failure(error))
            }
        }.resume()
        
    }
}
