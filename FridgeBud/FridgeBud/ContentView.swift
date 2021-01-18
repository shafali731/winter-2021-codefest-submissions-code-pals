
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
//        Spacer()
                Text("FridgeBud").font(.largeTitle).fontWeight(.bold).padding()
//        Spacer()
                HStack{
                    TextField("Enter ingredent...", text: self.$ing).padding().frame(width:(geometry.size.width/(3/2)), height:geometry.size.height/10).border(Color.green, width: 2)
                    Button("Enter Ingredient", action:{
                        if(self.$ing.wrappedValue != ""){
                            if (!(self.ingreds.contains(self.$ing.wrappedValue))){
                                self.ingreds.append((self.$ing.wrappedValue).replacingOccurrences(of: " ",with: "-"))
                            }
                            self.$ing.wrappedValue = ""
                        }
                        
        //                print("The list is: \(self.$ing.wrappedValue)")
                    }).frame(width:geometry.size.width*(1/3.5),height:geometry.size.height/10).border(Color.blue, width:1)
                }
                HStack{

                    if (!self.ingreds.isEmpty) {
                        ForEach(0..<self.ingreds.count, id:\.self){
                            value in (Button("\((self.ingreds[value]).replacingOccurrences(of: "-", with: " "))", action:{self.ingreds.remove(at: value)}).padding().background(Color.green))
                        }
                        
                    }
                    else{
                        Text("No Ingredients entered")
                    }
                }
                
        Spacer()
//            Button("GO!", action:hell).padding().frame(width:geometry.size.width/2).background(Color.accentColor).foregroundColor(Color.white).cornerRadius(8).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
//                NavigationLink(destination:SecondView(chosenIngredients: self.$ingreds)){
//                    Text("GO!")
                NavigationLink(destination: RecipeList(chosenIngredients: self.$ingreds.wrappedValue)){
                Text("Let's Get Cooking!")
//                        .frame(width:geometry.size.width/2).background(Color.accentColor).foregroundColor(Color.white).cornerRadius(8).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                }
                
        Spacer()
            }
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
//    @Binding var chosenIngredients: [String]
    var chosenIngredients: [String]
    var model: RecipeListViewModel
//    @State var ingredString : String = []
//    var model = RecipeListViewModel(ingredient : chosenIngredients)
    init(chosenIngredients: [String]){
        self.chosenIngredients = chosenIngredients
        self.model = RecipeListViewModel(ingredient : chosenIngredients)
//        self.ingredString = ""
    }
//    init(){
//        Webservice().getRecipes{
//            print($0)
//        }
//    }
//    func makeIngredString(){
//        if (!self.chosenIngredients.isEmpty) {
//            ForEach(0..<self.chosenIngredients.count, id:\.self){
//                value in ingredString += "\(value), "
//            }
//
//        }
//        else{
//            Text("No Ingredients entered")
//        }
//    }
    var body: some View{
//        NavigationView{
//        var model = getModel(ingredient: chosenIngredients)
//        List(model.recipes){
//            recipe in Text(recipe.title)
//        }
        
//        VStack{
//            Text("Ingredients Entered: \(chosenIngredients) ")
            List(model.recipes){
                recipe in NavigationLink(destination: RecipeDetail(RecipeDetailIngred: recipe)){
                Text("\(recipe.title)")
                }.navigationBarTitle("Recipes")
            }
//        }
//        }
    }
}
struct RecipeDetail: View{
    var RecipeDetailIngred: Response
    init(RecipeDetailIngred: Response){
        self.RecipeDetailIngred = RecipeDetailIngred
    }
    var body: some View{
//        NavigationView{
        VStack{
            Text(RecipeDetailIngred.title)
            Text("\(RecipeDetailIngred.usedIngredientCount)")
            Text("\(RecipeDetailIngred.missedIngredientCount)")
        }
//        }
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
//struct secondView: View{
//    @Binding var chosenIngredients: [String]
//    var body: some View{
//        VStack{
//        Text("hello")
//        Text("\(chosenIngredients[0])")
////        if (!self.chosenIngredients.isEmpty) {
////            ForEach(0..<self.chosenIngredients.count, id:\.self){
////                value in (Button("\(self.chosenIngredients[value])", action:{}).padding())
////            }
////
////        }
//        }
//    }
//}

