//
//  Note.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 06/03/2023.
//

import Foundation

struct Note: Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var content: String = ""
    var isFav: Bool = false
    
    var type: NoteType = .update
}

enum NoteType: Codable {
    case new
    case update
}
