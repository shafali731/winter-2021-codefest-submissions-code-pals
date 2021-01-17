//
//  RecipeListViewModel.swift
//  FridgeBud
//
//  Created by Shafali on 1/16/21.
//

import Foundation
import Combine
import SwiftUI

final class RecipeListViewModel: ObservableObject{
    init(){
        fetchRecipes()
    }
    var recipes = [Response](){
        didSet{
            didChange.send(self)
        }
    }
    private func fetchRecipes(){
        Webservice().getRecipes{
            self.recipes = $0
        }
    }
    let didChange = PassthroughSubject<RecipeListViewModel,Never>()
    
}
