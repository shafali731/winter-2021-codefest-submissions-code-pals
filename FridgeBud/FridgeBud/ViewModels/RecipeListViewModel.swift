//
//  RecipeListViewModel.swift
//  FridgeBud
//
//  Created by Shafali on 1/16/21.
//

import Foundation
import Combine
import SwiftUI

class RecipeListViewModel: ObservableObject{
    @State var ingredientsChosen : [String]
    init(ingredient: [String]){
        self.ingredientsChosen = ingredient
        if(!ingredientsChosen.isEmpty){
            print(ingredientsChosen[0])
            fetchRecipes(ingredientsList: ingredientsChosen)}
    }
    var recipes = [Response](){
        didSet{
            didChange.send(self)
        }
    }
    private func fetchRecipes(ingredientsList : [String]){
        Webservice().getRecipes(getRecipesIngredients: ingredientsList){
            self.recipes = $0
        }
    }
    let didChange = PassthroughSubject<RecipeListViewModel,Never>()
    
}
