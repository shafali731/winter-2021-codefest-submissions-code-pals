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
    @State var dietsChosen : [String]
    @State var thereAreRecipes : Bool
    init(ingredient: [String], diets: [String]){
        self.ingredientsChosen = ingredient
        self.dietsChosen = diets
        self.thereAreRecipes = true
        if(!ingredientsChosen.isEmpty){
            print(ingredientsChosen[0])
            if(!dietsChosen.isEmpty){
            print(dietsChosen[0])}
            fetchRecipes(ingredientsList: ingredientsChosen, dietList: dietsChosen)}
    }
    var recipes = [Response](){
        didSet{
            didChange.send(self)
        }
    }
    private func fetchRecipes(ingredientsList : [String], dietList : [String]){
        Webservice().getRecipes(getRecipesIngredients: ingredientsList, getRecipesDiets: dietList){
            self.recipes = [$0]
//            var emptyResponse = [Response]()
            if(self.recipes[0].results.isEmpty){
//                self.recipes = emptyResponse
                self.thereAreRecipes = false
                print("There are no")
            }
            print("the type of the thing is: \(type(of:self.recipes))")
            print(self.recipes)
        }
    }
    let didChange = PassthroughSubject<RecipeListViewModel,Never>()
    
}
