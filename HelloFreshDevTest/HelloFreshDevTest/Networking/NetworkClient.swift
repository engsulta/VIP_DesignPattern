//
//  NetworkClientProtocol.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.
//
import Foundation

/// concrete implementation for the client protocol
final class NetworkClient: NetworkClientProtocol {
    var session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
