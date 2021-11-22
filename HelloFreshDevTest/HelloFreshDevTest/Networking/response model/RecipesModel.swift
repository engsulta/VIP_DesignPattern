//
//  RecipesModel.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.
//
import Foundation

struct RecipesModel : Codable {

    let headline : String?
    let id : String?
    let image : String?
    let name : String?
    let preparationMinutes : Int?


    enum CodingKeys: String, CodingKey {
        case headline = "headline"
        case id = "id"
        case image = "image"
        case name = "name"
        case preparationMinutes = "preparation_minutes"
    }
}
