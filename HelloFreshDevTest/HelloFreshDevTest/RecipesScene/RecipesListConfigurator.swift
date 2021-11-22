//
//  RecipesListConfigurator.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.

import UIKit
// startegy design for configure vc, dependencies
protocol Configurator {
    associatedtype T
    func configure() -> T
}

struct RecipesListConfigurator: Configurator {
    func configure() -> RecipesListViewController {
        let viewController = UIStoryboard(name: "Recipes", bundle: nil).instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let presenter = RecipesListPresenter()
        let interactor = RecipesListInteractor(presenter: presenter)
        let dataSource = RecipesSceneListDataSource()
        presenter.displayView = viewController
        viewController.interactor = interactor
        viewController.dataSource = dataSource
        return viewController
    }
}
