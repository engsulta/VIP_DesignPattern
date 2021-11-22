//
//  RecipesListUIModels.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 14/11/2021.
//

import Foundation

enum RecipesListScene {
    enum RecipesList { }
}

extension RecipesListScene.RecipesList {
    struct ViewModel {
        let headline : String?
        let image : String?
        let name : String?
        let preparationMinutes : Int?
        var selected: Bool = false
    }
}
