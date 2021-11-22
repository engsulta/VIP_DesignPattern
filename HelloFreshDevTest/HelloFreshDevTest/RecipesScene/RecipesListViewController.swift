//
//  RecipesListViewController.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.

import UIKit


protocol RecipesListDisplayLogic: class {
    func presentRecipes(viewModel: [RecipesListScene.RecipesList.ViewModel])
    func showError(message: String)
}

class RecipesListViewController: UITableViewController, RecipesListDisplayLogic {
    var interactor: RecipesListBusinessLogic?
    var dataSource: RecipesSceneListDataSourceProtocol?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        interactor?.fetchRecipes{}
    }

    // MARK: View setup
    
    func setupUI() {
        title = "Recipes"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecipesCell.self)
       
    }
    
    // MARK: TableView DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRows(at: section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource!.cellForRaw(at: indexPath, tableView: tableView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource?.recipes[indexPath.row].selected.toggle()
        
        if let cell = tableView.cellForRow(at: indexPath) as? RecipesCell {
            cell.selectCell(dataSource?.recipes[indexPath.row].selected)
        }
    }

    // MARK: RecipesListDisplayLogic
    
    func presentRecipes(viewModel: [RecipesListScene.RecipesList.ViewModel]) {
        dataSource?.recipes = viewModel
        tableView.reloadData()
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Error Loading", message: "Something went wrong while loading recipes", preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { [weak self] (_) in
            self?.interactor?.fetchRecipes{}
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alertController.addAction(retryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
}
