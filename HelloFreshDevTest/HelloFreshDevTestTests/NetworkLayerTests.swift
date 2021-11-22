//
//  NetworkLayerTests.swift
//  HelloFreshDevTestTests
//
//  Created by Ahmed Sultan Hussien Hamza on 14/11/2021.
//

import XCTest
@testable import HelloFreshDevTest

class NetworkLayerTests: XCTestCase {
    var mockNetworkManager: NetworkClient!

    override func setUp() {
        super.setUp()
        mockNetworkManager = NetworkClient()
    }

    override func tearDown() {
        mockNetworkManager = nil
        super.tearDown()
    }

    func testRequestSucceed() {
        let exp = expectation(description: #function)
       
        mockNetworkManager?.fetch(endPoint: MockEndPoint(), model: [RecipesModel].self) { result in
            switch result {
            case let .success(recipesModel):
                XCTAssertEqual(recipesModel.first?.name, "test")
            case let .failure(err):
                XCTFail(err.localizedDescription)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testRequestFailedToDecode() {
        let exp = expectation(description: #function)
       
        mockNetworkManager?.fetch(endPoint: MockEndPoint(), model: [String].self) { result in
            switch result {
            case .failure(_): break
            default: XCTFail("test should return error")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testNetworkError() {
        XCTAssertEqual(NetworkError.missingURL.rawValue, "missing URL")
        XCTAssertEqual(NetworkError.faildToDecode.rawValue, "unable to decode the response")
    }
}
