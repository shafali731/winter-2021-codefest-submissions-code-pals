//
//  Recipes.swift
//  FridgeBud
//
//  Created by Shafali on 1/16/21.
//

import Foundation
import SwiftUI

struct Response: Codable, Hashable, Identifiable{
    var id = UUID()
    static func ==(lhs: Response, rhs: Response) -> Bool {
        return lhs.offset == rhs.offset && lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let results: [complexResult]
    let offset: Int?
    let number: Int?
    let totalResults: Int?
    enum CodingKeys: String, CodingKey {
        case results = "results"
            case offset = "offset"
            case number = "number"
            case totalResults = "totalResults"
    }
}
struct complexResult: Codable, Identifiable{
    let id: Int
    let usedIngredientsCount: Int?
    let missedIngredientCount: Int?
    let likes: Int
    let title: String
    let image: String
    let imageType: String
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case usedIngredientsCount = "usedIngredientsCount"
            case missedIngredientCount = "missedIngredientCount"
            case likes = "likes"
            case title = "title"
            case image = "image"
            case imageType = "imageType"
    }

}

//"id": 657306,
//"usedIngredientCount": 2,
//"missedIngredientCount": 8,
//"likes": 0,
//"title": "Pumpkin French Toast",
//"image": "https://spoonacular.com/recipeImages/657306-312x231.jpg",
//"imageType": "jpg"
//struct Response: Codable, Hashable, Identifiable{
//    var id = UUID()
//    static func ==(lhs: Response, rhs: Response) -> Bool {
//        return lhs.title == rhs.title && lhs.id == rhs.id
//    }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    let recipe_id: Int
//    let title: String
//    let image: String
//    let imageType: String
//    let usedIngredientCount: Int
//    let missedIngredientCount: Int
//    let missedIngredients: [ingredDict]?
//    let usedIngredients: [ingredDict]?
//    let unusedIngredients: [ingredDict]?
//    let likes: Int
//    enum CodingKeys: String, CodingKey {
//        case recipe_id = "id"
//        case title = "title"
//        case image = "image"
//        case imageType = "imageType"
//        case usedIngredientCount = "usedIngredientCount"
//        case missedIngredientCount = "missedIngredientCount"
//        case missedIngredients = "missedIngredients"
//        case usedIngredients = "usedIngredients"
//        case unusedIngredients = "unusedIngredients"
//        case likes = "likes"
//    }
//
//}
//struct ingredDict: Codable{
//    let id: Int
//    let amount: Float?
//    let unit: String?
//    let unitLong: String?
//    let unitShort: String?
//    let aisle: String?
//    let name: String?
//    let original: String?
//    let originalString: String?
//    let originalName: String?
//    let metaInformation: [String]?
//    let meta: [String]?
//    let image: String?
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case amount = "amount"
//        case unit = "unit"
//        case unitLong = "unitLong"
//        case unitShort = "unitShort"
//        case aisle = "aisle"
//        case name = "name"
//        case original = "original"
//        case originalString = "originalString"
//        case originalName = "originalName"
//        case metaInformation = "metaInformation"
//        case meta = "meta"
//        case image = "image"
//    }
//}

//"id": 93674,
//"amount": 0.5,
//"unit": "cup",
//"unitLong": "cups",
//"unitShort": "cup",
//"aisle": "Milk, Eggs, Other Dairy",
//"name": "cinnamon sugar butter",
//"original": "1/2 cup Land O Lakes® Cinnamon Sugar Butter Spread",
//"originalString": "1/2 cup Land O Lakes® Cinnamon Sugar Butter Spread",
//"originalName": "Land O Lakes® Cinnamon Sugar Butter Spread",
//"metaInformation": [
//    "lakes®"
//],
//"meta": [
//    "lakes®"
//],
//"image": "https://spoonacular.com/cdn/ingredients_100x100/cinnamon-sugar-butter.png"

//struct MyResult: Codable{
//    let id: Int
//    let title: String
//    let image: String
//    let imageType: String
//    let usedIngredientCount: Int
//    let missedIngredientCount: Int
//    let missedIngredients: [String]
//    let usedIngredients: [String]
//    let unusedIngredients: [String]
//    let likes: Int
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case title = "title"
//        case image = "image"
//        case imageType = "imageType"
//        case usedIngredientCount = "usedIngredientCount"
//        case missedIngredientCount = "missedIngredientCount"
//        case missedIngredients = "missedIngredients"
//        case usedIngredients = "usedIngredients"
//        case unusedIngredients = "unusedIngredients"
//        case likes = "likes"
//    }
//}

