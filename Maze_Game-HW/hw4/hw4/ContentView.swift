//
//  ContentView.swift
//  hw4
//
//  Created by Andy Huang on 3/2/23.

import SwiftUI

struct ContentView: View {
   // The navigationStack control point. If appended to, it will navigate the user to a new view.
   @State var navPath = NavigationPath()
   
   // TODO: Uncomment solutionPath and initialize it to the correct value.
   // Array of strings representing the path to the maze exit.
   @State var solutionPath: [String] = generate_turns(size: 3)
   
   // Array of strings representing the current path the user has taken.
   @State var currentPath: [String] = []
   // String representation of currentPath
   @State var currentPathString: String = ""
   // String representation of solutionPath. Helpful for debugging and testing.
   @State var solutionPathString: String = ""
   
   var body: some View {
      // NavigationStack wraps entire view.
      NavigationStack(path: $navPath) {
         VStack {
            // TODO: Menacing Maze Text Warning
            Text("☠️ Enter the maze at your own risk! ☠️")
            // TODO: Begin game Button
            // Append to navigationStack when button is pressed.
            Button("Begin Maze") {
               navPath.append("Begin Maze")
            }
            .padding()
         }
         .navigationTitle("Maze Game")
         // TODO: Replace DummyDataType with correct data type.
         .navigationDestination(for: String.self) { action in
            // TODO: Replace EmptyView() with code to display correct view based on action pushed onto the navigation stack.
            if (solutionPath == currentPath) {
               MazeExitView(navPath: $navPath, currentPath: $currentPath, solutionPath: $solutionPath, solutionPathString: $solutionPathString, currentPathString: $currentPathString)
            } else {
               MazeLocationView(previous_action: action, navPath: $navPath, currentPath: $currentPath, solutionPath: $solutionPath, solutionPathString: $solutionPathString, currentPathString: $currentPathString)
            }
         }
      }
      .onAppear {
         // TODO: Uncomment after initializing solutionPath
         solutionPathString = solutionPath.joined(separator: "->")
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
