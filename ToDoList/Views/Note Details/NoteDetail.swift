//
//  NoteDetail.swift
//  ToDoList
//
//  Created by Kareem Elfadaly on 06/03/2023.
//

import SwiftUI

struct NoteDetail: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData

    @FocusState private var isFocused: Bool

    @State var note: Note
    
    @State private var showsAlert = false
    

    var body: some View {
        Form {
            Section(header: Text("NOTE")) {
                VStack {
                    HStack {
                        TextField("Note name", text: $note.name)
                            .font(.largeTitle)
                            .backgroundStyle(.red)
                            .onAppear {
                                self.note.name = note.name
                            }
                            .focused($isFocused)
                        
                        Button {
                            addToFavourite()
                        } label: {
                            Image(systemName: note.isFav ? "star.fill" : "star")
                                .tint(.yellow)
                        }
                    }
                    .padding(.bottom , 20)

                    
                    TextField("Note content", text: $note.content)
                        .onAppear {
                            self.note.content = note.content
                        }
                        .focused($isFocused)
                }
            }
            .alert(isPresented: $showsAlert) {
                Alert(title: Text("Validation Error"),
                      message: Text("Please enter a valid data"),
                      primaryButton: .default(Text("Okay"), action: { showAlert(false) }),
                      secondaryButton: .destructive(Text("Cancel"), action: { showAlert(false) }))
            }
        }
        .onTapGesture {
            isFocused = false
        }
        .buttonStyle(.borderless)
        .navigationTitle(note.type == .new ? "Add Note" : note.name )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    saveItem()
                } label: {
                    Text("Save")
                }
            }
            
            if note.type == .new {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
            }
            
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button {
                    isFocused = false
                } label: {
                    Text("Done")
                }
            }
        }
    }
    
    private func addToFavourite() {
        note.isFav.toggle()
    }
    
    private func saveItem() {
        switch note.type {
        case .update:
            guard let index = modelData.notes.firstIndex(where: {$0.id == note.id}) else {return}
            modelData.notes[index] = note
            dismiss()

        case .new:
            if isValidNote() {
                guard let lastItemID = modelData.notes.last?.id else {return}
                note.id = lastItemID + 1
                note.type = .update
                modelData.notes.append(note)
                dismiss()
                
            } else {
                showAlert(true)
                isFocused = false
            }
        }
        
    }
    
    private func isValidNote() -> Bool {
        if (!note.name.isEmpty) && (!note.content.isEmpty) {
            return true
        } else {
            return false
        }
    }
    
    private func showAlert(_ value: Bool) {
        showsAlert = value
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var notes = ModelData().notes
    
    static var previews: some View {
        NoteDetail(note: notes[0])
    }
}
