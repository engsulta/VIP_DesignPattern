//
//  RecipesInteractorTests.swift
//  HelloFreshDevTestTests
//
//  Created by Ahmed Sultan Hussien Hamza on 15/11/2021.
//

import XCTest
@testable import HelloFreshDevTest

class RecipesInterActorTests: XCTestCase {
    
    var interactor: RecipesListBusinessLogic!
    var presenter: RecipesListPresentationLogic!
    var display: MockDisplay!
    var mockNetworkManager: NetworkClient!
    
    
    override func setUp() {
        super.setUp()
       
        presenter = RecipesListPresenter()
        display = MockDisplay()
        presenter.displayView = display
        let session = MockSession()
        session.mockData = "[ { \"name\": \"test\"}]".data(using: .utf8)
        mockNetworkManager = NetworkClient(session: session)
        
        interactor = RecipesListInteractor(presenter: self.presenter,
                                           networkClient: mockNetworkManager)
    }
    
    override func tearDown() {
        presenter = nil
        display = nil
        interactor = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testFetchRecipes() {
        let exp = expectation(description: #function)
        interactor.fetchRecipes {
            XCTAssertTrue(self.display.presentRecipesCalled)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 30)
    }

    func testFetchRecipesError() {
        
        let session = MockSession()
        session.mockData = "[ ahmed ]".data(using: .utf8)
        mockNetworkManager.session = session
        
        let exp = expectation(description: #function)
        interactor.fetchRecipes {
            XCTAssertEqual(self.display.showErrorMessage, "Test Error")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

}

