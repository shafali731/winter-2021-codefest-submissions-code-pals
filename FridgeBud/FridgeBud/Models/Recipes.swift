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
    let vegetarian: Bool
    let vegan: Bool
    let glutenFree: Bool
    let dairyFree: Bool
    let veryHealthy: Bool
    let cheap: Bool
    let veryPopular: Bool
    let sustainable: Bool
    let weightWatcherSmartPoints: Int
    let gaps: String
    let lowFodmap: Bool
    let aggregateLikes: Int
    let spoonacularScore: Float
    let healthScore: Float
    let creditsText: String
    let license: String
    let sourceName: String
    let pricePerServing: Float
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let sourceUrl: String
    let image: String
    let imageType: String
    let summary: String
    let cuisines: [String]
    let dishTypes: [String]
    let diets: [String]
    let occasions: [String]
    let analyzedInstructions: [analyzedInstructionsDict]
    let spoonacularSourceUrl: String
    let usedIngredientsCount: Int?
    let missedIngredientCount: Int?
    let likes: Int

    enum CodingKeys: String, CodingKey {
        case vegetarian = "vegetarian"
        case vegan = "vegan"
        case glutenFree = "glutenFree"
        case dairyFree = "dairyFree"
        case veryHealthy = "veryHealthy"
        case cheap = "cheap"
        case veryPopular = "veryPopular"
        case sustainable = "sustainable"
        case weightWatcherSmartPoints = "weightWatcherSmartPoints"
        case gaps = "gaps"
        case lowFodmap = "lowFodmap"
        case aggregateLikes = "aggregateLikes"
        case spoonacularScore = "spoonacularScore"
        case healthScore = "healthScore"
        case creditsText = "creditsText"
        case license = "license"
        case sourceName = "sourceName"
        case pricePerServing = "pricePerServing"
        case id = "id"
        case title = "title"
        case readyInMinutes = "readyInMinutes"
        case servings = "servings"
        case sourceUrl = "sourceUrl"
        case image = "image"
        case imageType = "imageType"
        case summary = "summary"
        case cuisines = "cuisines"
        case dishTypes = "dishTypes"
        case diets = "diets"
        case occasions = "occasions"
        case analyzedInstructions = "analyzedInstructions"
        case spoonacularSourceUrl = "spoonacularSourceUrl"
        case usedIngredientsCount = "usedIngredientsCount"
        case missedIngredientCount = "missedIngredientCount"
        case likes = "likes"
    }

}

struct analyzedInstructionsDict: Codable, Identifiable{
    var id = UUID()
    static func ==(lhs: analyzedInstructionsDict, rhs: analyzedInstructionsDict) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    let name: String
    let steps: [stepDict]
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case steps = "steps"
    }
}

struct stepDict: Codable, Hashable, Identifiable{
    var id = UUID()
    static func ==(lhs: stepDict, rhs: stepDict) -> Bool {
        return lhs.number == rhs.number && lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let number: Int
    let step: String
    let ingredients: [ingredientDict]
    let equipment: [ingredientDict]
    enum CodingKeys: String, CodingKey{
        case number = "number"
        case step = "step"
        case ingredients = "ingredients"
        case equipment = "equipment"
    }
}
struct ingredientDict: Codable, Hashable, Identifiable{
    let id: Int
    let name: String
    let localizedName: String
    let image: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case localizedName = "localizedName"
        case image = "image"
    }
}

struct lengthDict: Codable, Identifiable{
    var id = UUID()
    static func ==(lhs: lengthDict, rhs: lengthDict) -> Bool {
        return lhs.number == rhs.number && lhs.id == rhs.id
    }
    let number: Int
    let unit: String
    enum CodingKeys: String, CodingKey{
        case number = "number"
        case unit = "unit"
    }
}
