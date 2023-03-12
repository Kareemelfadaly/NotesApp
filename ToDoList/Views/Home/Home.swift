//
//  Home.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 06/03/2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingSheet = false
    
    @State private var showIsFav = false
   
    var filteredNotes: [Note] {
        modelData.notes.filter { note in
            (!showIsFav || note.isFav)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showIsFav) {
                    Text("Favorites only")
                }
                
                ForEach(filteredNotes) { item in
                    NavigationLink {
                        NoteDetail(note: item)
                    } label: {
                        NoteRow(note: item)
                    }
                }
                .onDelete(perform: delete(at:))

            }
            .refreshable { }
            .listStyle(.insetGrouped)
            .navigationTitle("Notes")
            .buttonStyle(.borderless)
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Label("Add", systemImage: "plus")
                }
                .sheet(isPresented: $showingSheet) {
                    NavigationView {
                        NoteDetail(note: Note(type: .new))
                    }
                }
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        modelData.notes.remove(atOffsets: offsets)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(ModelData())
    }
}
