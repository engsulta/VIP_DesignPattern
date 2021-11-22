//
//  RecipesSceneTests.swift
//  HelloFreshDevTestTests
//
//  Created by Ahmed Sultan Hussien Hamza on 14/11/2021.
//

import XCTest
@testable import HelloFreshDevTest

struct MockConfigurator: Configurator {
    func configure() -> RecipesListViewController {
        let viewController = UIStoryboard(name: "Recipes", bundle: nil).instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let presenter = RecipesListPresenter()
        let interactor = RecipesListInteractor(presenter: presenter,networkClient: NetworkClient(session: MockSession()))
        let dataSource = RecipesSceneListDataSource()
        presenter.displayView = viewController
        viewController.interactor = interactor
        viewController.dataSource = dataSource
        return viewController
    }
}


class RecipesSceneTests: XCTestCase {

    var interactor: RecipesListBusinessLogic!
    var dataSource: RecipesSceneListDataSourceProtocol!
    var vc: RecipesListViewController!

    override func setUp() {
        super.setUp()
        interactor = MockInteractor()
        dataSource = RecipesSceneListDataSource()
        
        vc = UIStoryboard(name: "Recipes", bundle: nil).instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        vc.interactor = interactor
        vc.dataSource = dataSource
        
        vc.loadViewIfNeeded()
    }
    
    func testPresentRecipes() {
        vc.presentRecipes(viewModel: [RecipesListScene.RecipesList.ViewModel(headline: "",
                                                                             image: "",
                                                                             name: "Test",
                                                                             preparationMinutes: 0,
                                                                             selected: true)])
        XCTAssertEqual(dataSource.recipes.first?.name, "Test")
    
    }
}

class MockInteractor: RecipesListBusinessLogic {
    func fetchRecipes(completion: (() -> Void)?) {
        completion?()
    }
}
