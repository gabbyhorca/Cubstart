//
//  ContentView.swift
//  Biography
//
//  Created by Enya Do on 3/7/23.


import SwiftUI

struct ContentView: View {
    //PART 2B - Create booleans to track your sheet visibility
    
    var body: some View {
        //PART1A - Design your header
       VStack {
          Text("Meet the dogs:").padding(.top, 30)
          Text("RILEY & RIGBY").font(.system(size: 35, weight: .bold, design: .serif))
             .italic().multilineTextAlignment(.center).font(.largeTitle)
          Image("IMG_8073").resizable().scaledToFit().cornerRadius(50).frame(width: 200.0, height: 200.0)
          Spacer()
       }
        //PART1B - Add your form containing your buttons
       Form {
           Button("Quick facts") {

               }
               .padding()
          Button("Fav football team") {

              }
              .padding()
          Button("Kissing or Fighting?") {

              }
              .padding()
          Button("Obedience") {

              }
              .padding()
       }
        
    }
}

//PART2A - Creating a sheet
struct Sheet1: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        Text("Riley Breed: Golden Doodle")
       Text("Riley Birthday: November 4")
       Text("Rigby Breed: Aussie Doodle")
       Text("Rigby Birthday: March ")
    }

}

// As a reminder the code below displays a live preview of your app, feel free to comment out or delete it!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
