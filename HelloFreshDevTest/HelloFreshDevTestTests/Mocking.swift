//
//  Mocking.swift
//  HelloFreshDevTestTests
//
//  Created by Ahmed Sultan Hussien Hamza on 15/11/2021.
//

import Foundation
@testable import HelloFreshDevTest

struct MockEndPoint: EndPointProtocol {
    var url: String {
        let localPath = Bundle.unitTest.url(
            forResource: "recipesStubs",
            withExtension: "json")?.absoluteString
        return localPath ?? ""
    }
}


class MockSession: URLSession {
    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(mockData,mockResponse,mockError)
        return URLSessionDataTask()
    }
}
