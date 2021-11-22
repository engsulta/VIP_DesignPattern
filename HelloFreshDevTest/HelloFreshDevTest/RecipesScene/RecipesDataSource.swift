//
//  RecipesDataSource.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 13/11/2021.
//

import UIKit
// to avoid using NSObjectProtocol
protocol RecipesSceneListDataSourceProtocol {
    var recipes: [RecipesListScene.RecipesList.ViewModel] { get set }
    func cellForRaw(at indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
    func numberOfRows(at section: Int) -> Int
}

class RecipesSceneListDataSource: RecipesSceneListDataSourceProtocol {
    
    var recipes: [RecipesListScene.RecipesList.ViewModel] = []
    
    func cellForRaw(at indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell: RecipesCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configure(recipes[indexPath.row])
        return cell
    }
    
    func numberOfRows(at section: Int) -> Int {
        recipes.count
    }
}
