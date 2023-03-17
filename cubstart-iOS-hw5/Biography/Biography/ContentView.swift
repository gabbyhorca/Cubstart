//
//  ContentView.swift
//  Biography
//
//  Created by Enya Do on 3/7/23.


import SwiftUI

struct ContentView: View {
   //PART 2B - Create booleans to track your sheet visibility
   @State private var showingSheet1 = false
   @State private var showingSheet2 = false
   @State private var showingSheet3 = false
   @State private var showingSheet4 = false
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
            showingSheet1.toggle()
         }
         .padding().sheet(isPresented: $showingSheet1) {
            Sheet1() }
         
         Button("Fav football team") {
            showingSheet2.toggle()
         }
         .padding().sheet(isPresented: $showingSheet2) {
            Sheet2() }
         Button("Kissing or Fighting?") {
            showingSheet3.toggle()
         }
         .padding().sheet(isPresented: $showingSheet3) {
            Sheet3() }
         Button("Obedience") {
            showingSheet4.toggle()
         }
         .padding().sheet(isPresented: $showingSheet4) {
            Sheet4() }
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
      Text("Riley Birthday: November 4, 2015")
      Text("Rigby Breed: Aussie Doodle")
      Text("Rigby Birthday: March 26, 2022")
      Button("back") {
         dismiss()
      }
      .padding().foregroundColor(.blue)
   }
   
}

struct Sheet2: View {
   //This code allows us to call the dismiss() function which closes the sheet view
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      Image("goniners").resizable().scaledToFit().cornerRadius(50)
      Text("Go niners!")
      Button("back") {
         dismiss()
      }
      .padding().foregroundColor(.blue)
   }
   
}

struct Sheet3: View {
   //This code allows us to call the dismiss() function which closes the sheet view
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      Image("sillydogs").resizable().scaledToFit().cornerRadius(50)
      Button("back") {
         dismiss()
      }
      .padding().foregroundColor(.blue)
   }
   
}

struct Sheet4: View {
   //This code allows us to call the dismiss() function which closes the sheet view
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      Image("theylisten").resizable().scaledToFit().cornerRadius(50)
      Button("back") {
         dismiss()
      }
      .padding().foregroundColor(.blue)
   }
   
}

// As a reminder the code below displays a live preview of your app, feel free to comment out or delete it!
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
