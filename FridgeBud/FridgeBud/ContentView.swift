
//  ContentView.swift
//  FridgeBud
//
//  Created by Shafali on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    @State var ing: String = ""
    @State var ingreds : [String] = []
    @State var expand = false
    @State var dietChose : [String] = []
//    self.diets = DropDownMenu().$dietChose.wrappedValue
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                ZStack(){
                Color("purpleback").edgesIgnoringSafeArea(.all)
                VStack(){
    //                Rectangle().fill(Color.blue).frame(height:50).navigationBarTitle("")
//                    Text("FridgeBud").font(.largeTitle).fontWeight(.bold).padding()
//                    Text("Welcome to: ").font(.custom("GillSans", size:24))
                    HStack{
                    Image("appicon")
                    Text("FridgeBuddy").font(.custom("Palatino-BoldItalic", size:50))
                    }.frame(alignment:.center)
                    HStack{
                        TextField("Enter ingredent...", text: self.$ing)
                            .padding().frame(width:(geometry.size.width/(3/2)), height:geometry.size.height/10).border(Color.blue, width: 2).background(Color("background_enter_button"))
//                             .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .border(Color.blue, width:2)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10.0).fill(Color("background_enter_button")).frame(width:(geometry.size.width/(3/2)), height:geometry.size.height/10)
//                            )
//                            .frame(width:(geometry.size.width/(3/2)), height:geometry.size.height/10).border(Color.blue, width: 2).foregroundColor(Color.blue)
                        Button("Enter Ingredient", action:{
                            if(self.$ing.wrappedValue != ""){
                                if (!(self.ingreds.contains(self.$ing.wrappedValue))){
                                    self.ingreds.append((self.$ing.wrappedValue).replacingOccurrences(of: " ",with: "-"))
                                }
                                self.$ing.wrappedValue = ""
                            }
                        }).frame(width:geometry.size.width*(1/3.5),height:geometry.size.height/10).border(Color.blue, width:2).font(.custom("GillSans", size:20)).background(Color("background_enter_button"))
                    }
                    self.generateContent(in: geometry)
                    Spacer()
//                    DropDownMenu()
                    VStack(){
                        VStack(spacing:-1){
                            HStack(){
                                Text("Choose Diet").fontWeight(.bold)
                                Image(systemName: self.expand ? "chevron.up": "chevron.down").resizable().frame(width:13, height: 6)
                            }.onTapGesture {
                                self.expand.toggle()
                            }
                            if(self.expand){
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Vegetarian")){
                                        self.dietChose.append("Vegetarian")}
                                }){
                                    Text("Vegetarian").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Gluten-Free")){
                                        self.dietChose.append("Gluten-Free")}
                                }){
                                    Text("Gluten Free").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Ketogenic")){
                                        self.dietChose.append("Ketogenic")}
                                }){
                                    Text("Ketogenic").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Lacto-Vegetarian")){
                                        self.dietChose.append("Lacto-Vegetarian")}
                                }){
                                    Text("Lacto-Vegetarian").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Ovo-Vegetarian")){
                                        self.dietChose.append("Ovo-Vegetarian")}
                                }){
                                    Text("Ovo-Vegetarian").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Pescetarian")){
                                        self.dietChose.append("Pescetarian")}
                                }){
                                    Text("Pescetarian").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Paleo")){
                                        self.dietChose.append("Paleo")}
                                }){
                                    Text("Paleo").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Primal")){
                                        self.dietChose.append("Primal")}
                                }){
                                    Text("Primal").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                                Button(action:{
                                    self.expand.toggle()
                                    if(!self.dietChose.contains("Whole30")){
                                        self.dietChose.append("Whole30")}
                                }){
                                    Text("Whole30").padding()
                                }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                            }
                        }.background(Color.blue).animation(.spring()).frame(width:geometry.size.width/2, height:geometry.size.height/6)
                        Spacer()
                        self.generateDiet(in: geometry)
                        Spacer()
//                        self.Print("from drop: \(self.dietChose)")
                    }
                    Spacer()
//                    self.Print("from content view: \(DropDownMenu().$dietChose.wrappedValue)")
                    NavigationLink(destination: RecipeList(chosenIngredients: self.$ingreds.wrappedValue, chosenDiets: self.$dietChose.wrappedValue)){
                        ButtonView()
                    }
                    Spacer()
                }
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
                    value in (Button(action:{self.ingreds.remove(at: value)}){HStack(spacing: 10){
                        Image(systemName: "xmark.circle")
                        Text("\((self.ingreds[value]).replacingOccurrences(of: "-", with: " "))")
                        }}.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color.blue, lineWidth: 2.0)
                    ))
//                        .background(Color.green))
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
    private func generateDiet(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero
            
            return ZStack(alignment: .topLeading){
                if (!self.dietChose.isEmpty) {
                    ForEach(0..<self.dietChose.count, id:\.self){
                        value in (Button(action:{self.dietChose.remove(at: value)}){HStack(spacing: 10){
                            Image(systemName: "xmark.circle")
                            Text("\((self.dietChose[value]).replacingOccurrences(of: "-", with: " "))")
                            }}.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(Color.blue, lineWidth: 2.0)
                        ))
    //                        .background(Color.green))
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if self.dietChose[value] == self.dietChose.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if self.dietChose[value] == self.dietChose.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                    }
                
                }
                else{
                }
        }
    }
}

struct ButtonView: View {
var body: some View {
    GeometryReader{
        geometry in
    Text("Let's Get Cooking")
        .frame(width: geometry.size.width/2, height: geometry.size.height/8, alignment: .center)
        .background(Color("background_enter_button"))
        .foregroundColor(Color.blue)
        .border(Color.blue, width:2)
    }
}
}
struct DropDownMenu: View{
    @State var expand = false
    @State var dietChose : [String] = []
    var body: some View{
        GeometryReader{ geometry in
        VStack(){
            VStack(spacing:-1){
                HStack(){
                    Text("Choose Diet").fontWeight(.bold)
                    Image(systemName: self.expand ? "chevron.up": "chevron.down").resizable().frame(width:13, height: 6)
                }.onTapGesture {
                    self.expand.toggle()
                }
                if(self.expand){
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Vegetarian")){
                            self.dietChose.append("Vegetarian")}
                    }){
                        Text("Vegetarian").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Gluten-Free")){
                            self.dietChose.append("Gluten-Free")}
                    }){
                        Text("Gluten Free").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Ketogenic")){
                            self.dietChose.append("Ketogenic")}
                    }){
                        Text("Ketogenic").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Lacto-Vegetarian")){
                            self.dietChose.append("Lacto-Vegetarian")}
                    }){
                        Text("Lacto-Vegetarian").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Ovo-Vegetarian")){
                            self.dietChose.append("Ovo-Vegetarian")}
                    }){
                        Text("Ovo-Vegetarian").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Pescetarian")){
                            self.dietChose.append("Pescetarian")}
                    }){
                        Text("Pescetarian").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Paleo")){
                            self.dietChose.append("Paleo")}
                    }){
                        Text("Paleo").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Primal")){
                            self.dietChose.append("Primal")}
                    }){
                        Text("Primal").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                    Button(action:{
                        self.expand.toggle()
                        if(!self.dietChose.contains("Whole30")){
                            self.dietChose.append("Whole30")}
                    }){
                        Text("Whole30").padding()
                    }.foregroundColor(.black).frame(width:geometry.size.width/2, height:30).border(Color.black, width:1)
                }
            }.background(Color.blue).animation(.spring()).frame(width:geometry.size.width/2, height:geometry.size.height/6)
            Spacer()
            self.generateDiet(in: geometry)
            Spacer()
            self.Print("from drop: \(self.dietChose)")
        }
        }
    }
        private func generateDiet(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero
            
            return ZStack(alignment: .topLeading){
                if (!self.dietChose.isEmpty) {
                    ForEach(0..<self.dietChose.count, id:\.self){
                        value in (Button(action:{self.dietChose.remove(at: value)}){HStack(spacing: 10){
                            Image(systemName: "xmark.circle")
                            Text("\((self.dietChose[value]).replacingOccurrences(of: "-", with: " "))")
                            }}.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(Color.blue, lineWidth: 2.0)
                        ))
    //                        .background(Color.green))
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if self.dietChose[value] == self.dietChose.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if self.dietChose[value] == self.dietChose.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                    }
                
                }
                else{
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
    var chosenDiets : [String]
    var model: RecipeListViewModel
    init(chosenIngredients: [String], chosenDiets: [String]){
        self.chosenIngredients = chosenIngredients
        self.chosenDiets = chosenDiets
        print("The diets: \(self.chosenDiets)")
        self.model = RecipeListViewModel(ingredient : chosenIngredients, diets: chosenDiets )
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
                .frame(width: 200, alignment: .topLeading).edgesIgnoringSafeArea(.all)
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

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
