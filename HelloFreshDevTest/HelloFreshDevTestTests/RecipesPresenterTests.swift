//
//  RecipesPresenterTests.swift
//  HelloFreshDevTestTests
//
//  Created by Ahmed Sultan Hussien Hamza on 15/11/2021.
//

import XCTest
@testable import HelloFreshDevTest

class RecipesPresenterTests: XCTestCase {
    
    var presenter: RecipesListPresentationLogic!
    var display: MockDisplay!
    
    
    override func setUp() {
        super.setUp()
        presenter = RecipesListPresenter()
        display = MockDisplay()
        presenter.displayView = display
        
    }
    
    override func tearDown() {
        presenter = nil
        display = nil
        super.tearDown()
    }
    
    func testPresentRecipes() {
        presenter.presentRecipes([])
        XCTAssertTrue(display.presentRecipesCalled)
    }

    func testShowErrorRecipes() {
        presenter.ShowMissingRecipes(message: "")
        XCTAssertEqual(display.showErrorMessage, "Test Error")
    }
}

class MockDisplay: RecipesListDisplayLogic {
    
    var presentRecipesCalled: Bool = false
    var showErrorMessage: String = ""
    
    func presentRecipes(viewModel: [RecipesListScene.RecipesList.ViewModel]) {
        presentRecipesCalled = true
    }
    
    func showError(message: String)  {
        showErrorMessage = "Test Error"
    }
}
