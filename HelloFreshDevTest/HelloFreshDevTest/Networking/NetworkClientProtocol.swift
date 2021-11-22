//
//  NetworkClientProtocol.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.

import Foundation

typealias NetworkCompletion<T:Decodable> = (Result<T,Error>) -> Void

/// protocol for client api
protocol NetworkClientProtocol {
    var session: URLSession { get }
    func fetch<T: Decodable>(endPoint: EndPointProtocol,
                             model: T.Type,
                             completion: @escaping NetworkCompletion<T>)
}


// MARK: - fetch implementation
extension NetworkClientProtocol {
    func fetch<T: Decodable>(endPoint: EndPointProtocol,
                             model: T.Type,
                             completion: @escaping NetworkCompletion<T>) {
        guard let url = URL(string: endPoint.url) else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.missingURL))
            }
            return
        }
        let currentTask =
            session.dataTask(with: url) { data, response, error in
                print("[LOG] response: \(String(describing: response))")
                guard let jsonData = data else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.noNetwork))
                        print("[LOG] error from api \(NetworkError.noNetwork.rawValue)")
                    }
                    return
                }
                do {
                    let responseModel = try JSONDecoder().decode(model, from: jsonData)
                    DispatchQueue.main.async {
                        completion(.success(responseModel))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.noNetwork))
                        print("[LOG] error from api \(NetworkError.faildToDecode.rawValue)")
                    }
                }
            }
        currentTask.resume()
    }
}
