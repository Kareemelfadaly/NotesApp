//
//  NoteRow.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 06/03/2023.
//

import SwiftUI

struct NoteRow: View {
    @EnvironmentObject var modelData: ModelData
    var note: Note
    
    @State private var isFav = false
    
    init(note: Note) {
        self.note = note
        self.isFav = note.isFav
    }
    
    var body: some View {
        HStack {
            Text(note.name)
                .bold(note.isFav)
            Spacer()
            Button {
                toggleFavourite()
            } label: {
                Image(systemName: note.isFav ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
    
    func toggleFavourite() {
        isFav.toggle()
        guard let index = modelData.notes.firstIndex(where: {$0.id == note.id}) else {return}
        modelData.notes[index].isFav = isFav
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var notes = ModelData().notes

    static var previews: some View {
        Group {
            NoteRow(note: notes[0])
        }
    }
}
