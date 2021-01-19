//
//  Webservices.swift
//  FridgeBud
//
//  Created by Shafali on 1/16/21.
//

import Foundation

class Webservice{
    func getRecipes(getRecipesIngredients: [String], completion:@escaping (Response) -> ()){
        var urlIngreds: String = ""
        let apiKey: String = "faadf6181c8548f2bdbe37a0d80bf778"
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
        
        guard let url = URL(string:"https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&includeIngredients=\(urlIngreds)&number=20&addRecipeInformation=true") else{
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
