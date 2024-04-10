//
//  PreferencesView.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/5/24.
//

import SwiftUI
import Observation

struct PreferencesView: View {
    @State var preferencesController = PreferencesController()
    
    @State var selection: Set<AllowedFileExtension.ID> = []
    
    
    var body: some View {
        List($preferencesController.allowedImageFileExtensions,
             id: \.id,
             editActions: [.delete,. move],
             selection: $selection)
        { $nextExtension in
            TextField("File Extension", text: $nextExtension.fileExtension)
                .contextMenu {
                    Button("Delete", action: deleteSelection)
                }
        }.toolbar() {
            ToolbarItem() {
                Button(action: addNewFileExtension, label: {
                    Image(systemName: "plus")
                })
            }
            ToolbarItem {
                Button(action: deleteSelection, label: {
                    Image(systemName: "minus")
                })
            }
        }
    }
    
    private func addNewFileExtension() {
        preferencesController.addExtension()
    }
    
    private func deleteSelection() {
        let selectionArray = Array(selection)
        
        let extensionsToDelete = preferencesController.allowedImageFileExtensions.filter({selectionArray.contains($0.id)})
        
        preferencesController.removeExtensions(extensionsToDelete)
    }
}


/*
 #Preview {
 PreferencesView()
 }
 */

