//
//  Webservices.swift
//  FridgeBud
//
//  Created by Shafali on 1/16/21.
//

import Foundation

class Webservice{
    func getRecipes(getRecipesIngredients: [String], completion:@escaping ([Response]) -> ()){
        var urlIngreds: String = ""
        let apiKey: String = "ca8dd14426f04b6f958d3e200358d633"
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
        
//        guard let url = URL(string:"https://api.spoonacular.com/recipes/findByIngredients?apiKey=d05c6cc4c5f44729b97a878c398eca4d&ingredients=apples,+flour,+sugar&number=2") else{
        guard let url = URL(string:"https://api.spoonacular.com/recipes/findByIngredients?apiKey=\(apiKey)&ingredients=\(urlIngreds)&number=20") else{

            fatalError("Url not correct")
        }
        print(url)
        URLSession.shared.dataTask(with: url){
            data, _, _ in
            let recipes = try! JSONDecoder().decode([Response].self, from: data!)
            DispatchQueue.main.async {
                completion(recipes)
            }
            }.resume()
    }
}

//class ViewController:UIViewController{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=d05c6cc4c5f44729b97a878c398eca4d&ingredients=apples,+flour,+sugar&number=2"
//        getData(from: url)
//    }
//    private func getData(from url:String){
//        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler : { data, response, error in
//            guard let data = data, error == nil else{
//                print("something went wrong")
//                return
//            }
//            //have data
//            var result: Response?
//            do{
//                result = try JSONDecoder().decode(Response.self, from: data)
//            }
//            catch{
//                print("failed to conver \(error.localizedDescription) ")
//            }
//            guard let json = result else{
//                return
//            }
//            print(json.results.id)
//            print(json.results.title)
//            })
//        task.resume()
//
//    }
//}
