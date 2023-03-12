//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 05/03/2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
