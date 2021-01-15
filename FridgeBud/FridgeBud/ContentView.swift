
//  ContentView.swift
//  FridgeBud
//
//  Created by Shafali on 1/13/21.
//

import SwiftUI
func hell(){
    print("fehiuh")
}
//class boxes{
//
//}
//func printing_in(listers:[String])->View{
//    for item in listers{
//        print(item)
//    }
//}
//var ingreds : [String] = []
//func addToIngreds(item:String, arrayCh:Array<String>){
//    arrayCh.append(item)
//    print("\(item) hejfoiej")
//    if(arrayCh.isEmpty){
//        print("bitch is still empty")
//    }
//    else{
//        print("first item is \(arrayCh[0])")
//    }
//}
//struct IngredList: View {
//
//    var body: some View {
//    HStack{
//        ForEach(ingreds, id:\.self){
//        ingred in Text(ingred).background(Color.green)
//                    }
//                        }
//    }
//}
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
            Text("Fridge App").font(.largeTitle).fontWeight(.bold).padding()
//        Spacer()
        HStack{
            TextField("Enter ingredent...", text: self.$ing).padding().frame(width:(geometry.size.width/(3/2)), height:geometry.size.height/10).border(Color.green, width: 2)
            Button("Enter Ingredient", action:{
                if(self.$ing.wrappedValue != ""){
                    self.ingreds.append(self.$ing.wrappedValue)}
//                addToIngreds(item:self.$ing.wrappedValue )
//                ingreds.append(self.$ing.wrappedValue)
//                ingreds[0] = self.$ing.wrappedValue
                print(self.$ing.wrappedValue)
            }).frame(width:geometry.size.width*(1/3.5),height:geometry.size.height/10).border(Color.blue, width:1)
                }
//                Spacer()
        HStack{
//            ForEach(ingreds, id:\.self){
////                print()
////                ind in Text(ind)
//                ingred in Text(ingred).background(Color.green)
//            }
//                }
                if (!self.ingreds.isEmpty) {
                    ForEach(0..<self.ingreds.count, id:\.self){
                        value in (Button("\(self.ingreds[value])", action:{}).padding().background(Color.green))
                    }
                    
                }
                else{
                    Text("No Ingredients entered")
                }
                }
        Spacer()
//            Button("GO!", action:hell).padding().frame(width:geometry.size.width/2).background(Color.accentColor).foregroundColor(Color.white).cornerRadius(8).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                NavigationLink(destination:secondView(chosenIngredients: self.$ingreds)){
                    Text("GO!")
//                        .frame(width:geometry.size.width/2).background(Color.accentColor).foregroundColor(Color.white).cornerRadius(8).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                }
                
        Spacer()
            }
        }
    }
}
}

struct secondView: View{
    @Binding var chosenIngredients: [String]
    var body: some View{
        VStack{
        Text("hello")
        Text("\(chosenIngredients[0])")
//        if (!self.chosenIngredients.isEmpty) {
//            ForEach(0..<self.chosenIngredients.count, id:\.self){
//                value in (Button("\(self.chosenIngredients[value])", action:{}).padding())
//            }
//
//        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
