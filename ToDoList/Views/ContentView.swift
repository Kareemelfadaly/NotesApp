//
//  ContentView.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Notes", systemImage: "star")
                }
            
            Text("Welcome")
                .bold()
                .tabItem {
                    Label("Menu", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
