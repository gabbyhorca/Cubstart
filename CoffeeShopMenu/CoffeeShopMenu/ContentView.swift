//
//  ContentView.swift
//  CoffeeShopMenu
//
//  Created by Enya Do on 2/22/23.
//

import SwiftUI

//PART 1A: Uncomment the section below

class Coffee: ObservableObject, Identifiable {
    var itemNum: Int
    
    var drinkName: String
        
    var drinkType: String
    
    var price: Double
    
    @State var quantity: Int
    
    //Complete the class constructor
   init(itemNum: Int, drinkName: String, drinkType: String, price: Double, quantity: Int) {
      self.itemNum = itemNum
      self.drinkName = drinkName
      self.drinkType = drinkType
      self.price = price
      self.quantity = 0
    }
}


struct ContentView: View {
    //PART 1B: Initialize objects of the Coffee class aka "menu items" below
    @StateObject var latte = Coffee(itemNum: 1, drinkName: "I Love You a Latte", drinkType: "Latte", price: 3.75, quantity: 0)
    @StateObject var espresso = Coffee(itemNum: 2, drinkName: "Not Espresso Depresso", drinkType: "Espresso", price: 3.25, quantity: 0)
    @StateObject var mocha = Coffee(itemNum: 3, drinkName: "Loca for Mocha", drinkType: "Mocha", price: 4.00, quantity: 0)
    @StateObject var coldBrew = Coffee(itemNum: 4, drinkName: "Brew-tiful Day", drinkType: "Cold Brew", price: 3.00, quantity: 0)
    
    //PART 4A - Instantiate variables that will help us calculate and display the total price
    
    @State private var totalPrice = 0.0
    @State private var currentPrice = 0.0
    @State private var showPrice = false
    
    //PART 2A  - Uncomment the section below
    
    @State private var coffeeList: [Coffee] = []
    
    //Helpter Function to be called when body is run that will add objects to coffeeList
    func addListItems() {
        coffeeList = [latte, espresso, mocha, coldBrew] //Add your objects to your list here!
    }
    
    
    // PART 3D: Helper function that updates currentPrice
    func updateCurrentPrice() {
        currentPrice = totalPrice
    }
   
    
    var body: some View {
        VStack {
            //PART 2C: EDIT THE TITLE AND ADD A SUBTITLE BELOW
           Text("Millennial Coffee Puns").bold()
            
            VStack {
                //PART 2C: ADD SOME MENU HEADERS IN THE HSTACK BELOW
                 HStack {
                    Text("Drink Name: ").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Text("Quantity: ").padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0))
                 }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                     .bold()
               //Spacer()
                
                //PART2B: DISPLAYING OUR MENU ITEMS
                
                ForEach(coffeeList) {i in
                    HStack {
                        VStack(alignment: .leading) {
                  
                            //Formats the price to a double containing 2 digits after the decimal point
                           var formattedPrice = String(format: "%.2f", i.price)
                            
                            //Display itemNum and drinkName
                           Text(String(i.itemNum) + ". " + i.drinkName)
                            
                            //Display drinkType and
                           Text("    " + i.drinkType + ", $" + formattedPrice).italic()
                        } .padding(.bottom, 10)
                 
                        Spacer()
                
                        
                        //PART 3A: Decrement Buttom - Uncomment the section below
                        
                        Button("-", action: {
                            if (i.quantity > 0) {
                               showPrice = false
                               i.quantity -=  1
                               //3C: Add a line of code to update the totalPrice variable below
                               totalPrice += Double(i.quantity) * i.price
                               
                            }
                        }).padding(.bottom, 20)
                         
                        
                        //PART 2B: Display the quantity of each item
                        
                        VStack(alignment: .leading) {
                           Text(String(i.quantity))
                        } .padding(.bottom, 20)
                        
                
                        //PART 3A: IMPLEMENT YOUR INCREMENT BUTTON IN THE SPACE BELOW
                       Button("+", action: {
                           if (i.quantity > 0) {
                              showPrice = false
                              i.quantity +=  1
                              totalPrice += Double(i.quantity) * i.price
                              
                           }
                       }).padding(.bottom, 20)
                
                    }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 70))
                }.padding(.bottom, 15)
                
                //PART 3D - Implement totalPrice displaying button, Uncomment the section below
                VStack {
                    Button("Calculate Total Price", action: {
                        //IMPLEMENT THE FUNCTIONALITY OF THE BUTTON NELOW
                       showPrice = true
                        
                    }).buttonStyle(.automatic)
                        .font(.system(size: 20))
                        .padding(.bottom, 5)
                        .bold()
                 
                    //Formats the currentPrice to a double containing 2 digits after the decimal point
                    let formattedTotalPrice = String(format: "%.2f", currentPrice)
                    
                    if showPrice {
                        //UPDATE THE EMPTY TEXT TO DISPLAY THE TOTAL PRICE WHEN SHOWPRICE IS TRUE
                        Text(String(totalPrice))
                    }
                }.padding(.top, 30)
                 
                
            }
            
            Spacer()
            
        }.padding(.top, 55)
            .onAppear(perform: addListItems)
    }
}


// This code generates a live content preview, feel free to delete it and use build instead to view your app!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
