
//  ContentView.swift
//  FridgeBud
//
//  Created by Shafali on 1/13/21.
//

import SwiftUI
func hell(){
    print("fehiuh")
}

var finalListIng: [String] = []


struct ContentView: View {
    @State var ing: String = ""
    @State var ingreds : [String] = []
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack(){
    //                Rectangle().fill(Color.blue).frame(height:50).navigationBarTitle("")
                    Text("FridgeBud").font(.largeTitle).fontWeight(.bold).padding()
                    HStack{
                        TextField("Enter ingredent...", text: self.$ing).padding().frame(width:(geometry.size.width/(3/2)), height:geometry.size.height/10).border(Color.green, width: 2)
                        Button("Enter Ingredient", action:{
                            if(self.$ing.wrappedValue != ""){
                                if (!(self.ingreds.contains(self.$ing.wrappedValue))){
                                    self.ingreds.append((self.$ing.wrappedValue).replacingOccurrences(of: " ",with: "-"))
                                }
                                self.$ing.wrappedValue = ""
                            }
                        }).frame(width:geometry.size.width*(1/3.5),height:geometry.size.height/10).border(Color.blue, width:1)
                    }
                    self.generateContent(in: geometry)
                    Spacer()
                    NavigationLink(destination: RecipeList(chosenIngredients: self.$ingreds.wrappedValue)){
                    Text("Let's Get Cooking!")
                    }
                
                    Spacer()
                }
            }
        }
    }
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading){
            if (!self.ingreds.isEmpty) {
                ForEach(0..<self.ingreds.count, id:\.self){
                    value in (Button("\((self.ingreds[value]).replacingOccurrences(of: "-", with: " "))", action:{self.ingreds.remove(at: value)}).padding().background(Color.green))
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if self.ingreds[value] == self.ingreds.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if self.ingreds[value] == self.ingreds.last! {
                            height = 0 // last item
                        }
                        return result
                    })
                }
            
            }
            else{
                Text("No Ingredients entered")
            }
        }
    }
}

//func getModel(ingredient: [String])-> RecipeListViewModel{
//    return RecipeListViewModel(ingredient)
//}
//func makeIngredString(ingredientsStringEntry: [String])-> String{
//    var ingredString = ""
////        if (!ingredientsStringEntry.isEmpty) {
//            ForEach(0..<ingredientsStringEntry.count, id:\.self){
//                value in ingredString += "\(value), "
//            }
//    return ingredString
////        }
////        else{
////            Text("No Ingredients entered")
////        }
//    }
struct RecipeList: View {
    var chosenIngredients: [String]
    var model: RecipeListViewModel
    init(chosenIngredients: [String]){
        self.chosenIngredients = chosenIngredients
        self.model = RecipeListViewModel(ingredient : chosenIngredients)
    }
    var body: some View{
        GeometryReader{ geometry in
            List(self.model.recipes[0].results){
                recipe in NavigationLink(destination: RecipeDetail(RecipeDetailIngred: recipe)){
                    RemoteImage(url: recipe.image).frame(width: geometry.size.width/5, height:geometry.size.height/10)
                Text("\(recipe.title)")
                }.navigationBarTitle("Recipes")
            }
        }
    }
}
struct RecipeDetail: View{
    var RecipeDetailIngred: complexResult
    init(RecipeDetailIngred: complexResult){
        self.RecipeDetailIngred = RecipeDetailIngred
    }
    var body: some View{
        VStack{
            RemoteImage(url: RecipeDetailIngred.image)
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            Text("\(RecipeDetailIngred.title)")
            Text("\(RecipeDetailIngred.servings)")
            Button("Go to the Recipe", action:{UIApplication.shared.open(URL(string: "\(self.RecipeDetailIngred.sourceUrl)")!)})
            Button("Get a more detailed view", action:{UIApplication.shared.open(URL(string: "\(self.RecipeDetailIngred.spoonacularSourceUrl)")!)})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

//Code imported from https://www.hackingwithswift.com/forums/swiftui/loading-images/3292

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @ObservedObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = ObservedObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
