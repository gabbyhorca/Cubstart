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
          Text("Meet the dogs:")
          Text("RILEY & RIGBY").font(.system(size: 35, weight: .bold, design: .serif))
             .italic().multilineTextAlignment(.center).font(.largeTitle)
          Image("IMG_8073").resizable().scaledToFit().cornerRadius(50).frame(width: 200.0, height: 200.0)
       }
        //PART1B - Add your form containing your buttons
        
    }
}

//PART2A - Creating a sheet
struct Sheet1: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        Text("This is sheet one")
    }

}

// As a reminder the code below displays a live preview of your app, feel free to comment out or delete it!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
