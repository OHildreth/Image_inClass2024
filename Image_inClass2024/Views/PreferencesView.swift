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
        VStack {
            Button("+") {
                preferencesController.addExtension()
            }
            .padding()
            
            List($preferencesController.allowedImageFileExtensions,
                 id: \.id,
                 editActions: [.delete,. move],
                 selection: $selection)
            { $nextExtension in
                TextField("File Extension", text: $nextExtension.fileExtension)
                    .contextMenu {
                        Button("Delete") {
                            let selectionArray = Array(selection)
                            
                            let extensionsToDelete = preferencesController.allowedImageFileExtensions.filter({selectionArray.contains($0.id)})
                            
                            preferencesController.removeExtensions(extensionsToDelete)
                        }
                    }
            }
        }
    }
}


/*
 #Preview {
     PreferencesView()
 }
 */

