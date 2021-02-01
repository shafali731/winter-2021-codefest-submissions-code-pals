//
//  Webservices.swift
//  FridgeBud
//
//  Created by Shafali on 1/16/21.
//

import Foundation

class Webservice{
    func getRecipes(getRecipesIngredients: [String], getRecipesDiets: [String], completion:@escaping (Response) -> ()){
        var urlIngreds: String = ""
        var urlDiets: String = ""
        let apiKey: String = "cb149225d1ef4f51b29d2a51b7c2add5"
//        print("webservice: \(getRecipesIngredients[0])")
        if(!getRecipesIngredients.isEmpty){
            print("webservice: \(getRecipesIngredients[0])")
            for item in getRecipesIngredients{
                if(item == getRecipesIngredients[0]){
                    urlIngreds += item
                }
                else{
                    urlIngreds += ",+\(item)"
                }
            }
        }
        for item in getRecipesDiets{
            if(item == getRecipesDiets[0]){
                urlDiets += item
            }
            else{
                urlDiets += ",+\(item)"
            }
        }
        guard let url = URL(string:"https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&includeIngredients=\(urlIngreds)&number=1&addRecipeInformation=true&diet=\(urlDiets)") else{
//        guard let url = URL(string:"https://api.spoonacular.com/recipes/findByIngredients?apiKey=\(apiKey)&ingredients=\(urlIngreds)&number=20&ranking=2") else{

            fatalError("Url not correct")
        }
        print(url)
        URLSession.shared.dataTask(with: url){
            data, _, _ in
            let recipes = try! JSONDecoder().decode(Response.self, from: data!)
            DispatchQueue.main.async {
                completion(recipes)
            }
            }.resume()
    }
}
