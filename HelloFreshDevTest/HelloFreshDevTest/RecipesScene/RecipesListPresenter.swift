//
//  RecipesListPresenter.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.

import UIKit

protocol RecipesListPresentationLogic {
    var displayView: RecipesListDisplayLogic? { get set }
    func presentRecipes(_ recipes: [RecipesModel])
    func ShowMissingRecipes(message: String)
}

class RecipesListPresenter: RecipesListPresentationLogic {
    weak var displayView: RecipesListDisplayLogic?
    
    // MARK: Do RecipesListPresentationLogic
    
    func presentRecipes(_ recipes: [RecipesModel]) {
        var viewModels =  [RecipesListScene.RecipesList.ViewModel]()
        viewModels = recipes.compactMap { model in
            return RecipesListScene.RecipesList.ViewModel(headline: model.headline,
                                                                          image: model.image,
                                                                          name: model.name,
                                                                          preparationMinutes: model.preparationMinutes,
                                                                          selected: false)
        }
        displayView?.presentRecipes(viewModel: viewModels)
    }
    
    func ShowMissingRecipes(message: String) {
        displayView?.showError(message: message)
    }
}
