//
//  ModelData.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 06/03/2023.
//

import Foundation

final class ModelData: ObservableObject {

    @Published var notes: [Note] =
        [
         Note(id: 1, name: "First", content: "my content", isFav: true),
         Note(id: 2, name: "Second", content: "asdfsadfsad", isFav: false),
         Note(id: 3, name: "Third", content: "xcvxcv"),
         Note(id: 4, name: "Forth", content: "xvxcz ssd"),
         Note(id: 5, name: "Fifth", content: "my content"),
         Note(id: 6, name: "Hello", content: "my content", isFav: true),
         Note(id: 7, name: "Hi", content: "my content"),
         Note(id: 8, name: "New new", content: "my content", isFav: true),
         Note(id: 9, name: "12eqwe", content: "my content"),
         Note(id: 10, name: "adf;f", content: "my content")
        ]
    
}
