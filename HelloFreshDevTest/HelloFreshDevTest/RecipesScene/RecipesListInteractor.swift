//
//  RecipesListInteractor.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.

import UIKit


protocol RecipesListBusinessLogic {
    func fetchRecipes(completion: (() -> Void)?)
}

class RecipesListInteractor: RecipesListBusinessLogic {
    private let presenter: RecipesListPresentationLogic?
    private let networkClient: NetworkClientProtocol?

    init (presenter: RecipesListPresentationLogic,
          networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
        self.presenter = presenter
    }

    // MARK: Fetch Recipes

    func fetchRecipes(completion: (() -> Void)? = nil) {
        networkClient?.fetch(endPoint: RecipesEndPoint.recipes, model: [RecipesModel].self) { [weak self] result in
            switch result {
            case let .success(recipesModel):
                self?.presenter?.presentRecipes(recipesModel)
            case let .failure(err):
                self?.presenter?.ShowMissingRecipes(message: err.localizedDescription)
            }
            completion?()
        }
    }
}
