//
//  ContentView.swift
//  HW72
//
//  Created by Abinaya on 3/21/23.
//

import SwiftUI
import Firebase
import FirebaseCore

struct SuccessScreen: View {
   var body: some View {
      Text("Success!")
   }
}

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    //TODO: add a variable that tracks whether the user has successfully logged in or not
   @State var logInSuccess = false;
    
    init() {
        FirebaseApp.configure()
    }
    
    func login() {
       Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
          if error != nil {
             print(error?.localizedDescription ?? "")
          } else {
             //                TODO: update the variable to track that the user has successfully logged in
             logInSuccess = true;
             print("success")
          }
       }
    }
   

    var body: some View {
        //TODO: Implement an if-else to return a new view when a certain condition is met
       if (logInSuccess) {
          SuccessScreen()
       }
       else {
          TextField("Email", text: $email).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
              TextField("Password", text: $password).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
                  
              Button(action: { login() }){
                       Text("Sign in")
                   }.buttonStyle(. bordered).tint(.mint)
          }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
