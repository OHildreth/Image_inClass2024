//
//  SourceList.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import SwiftUI
import SwiftData

struct SourceList: View {
    
    var dataModel: DataModel
    
    @Bindable var selectionManager: SelectionManager
    
    @State private var showAlert = false
    
    var body: some View {
        List(selection: $selectionManager.selectedNodes) {
            OutlineGroup(dataModel.rootNodes, id:\.self, children: \.subNodes) { nextNode in
                HStack {
                    Image(systemName: "folder.fill")
                    Text(nextNode.name)
                }
                .dropDestination(for: URL.self) { urls, _ in
                    importURLs(urls, intoNode: nextNode)
                    return true
                }
                .alert(isPresented: $showAlert) {importAlert}
            }

        }
        
         .dropDestination(for: URL.self) { urls, _ in
             importURLs(urls, intoNode: nil)
             return true
         }
         .alert(isPresented: $showAlert) {importAlert}
    }
    
    private func importURLs(_ urls: [URL], intoNode parentNode: Node?) {
        do {
            try dataModel.importURLs(urls, intoNode: parentNode)
        } catch {
            if let importError = error as? DataModel.ImportError {
                if importError == .cannotImportFileWithoutANode {
                    self.showAlert = true
                }
            }
        }
    }
    
    private var importAlert: Alert {
        Alert(title: Text("Import Error"), message: Text("Image Files must be imported into an existing folder"))
    }
}


/*
 #Preview {
     SourceList()
 }
 */

