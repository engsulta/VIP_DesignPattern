//
//  RecipesEndPoint.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 12/11/2021.
//
import Foundation

protocol EndPointProtocol {
    var url: String { get }
}

///  End-point representation for playlist EndPoint
enum RecipesEndPoint: EndPointProtocol {
    case recipes
    var url: String {
        return Services.recipesURL
    }
}


enum Services {
    static let recipesURL = "https://hf-mobile-app.s3-eu-west-1.amazonaws.com/ios/recipes_v3.json"
}
