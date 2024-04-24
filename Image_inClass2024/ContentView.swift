//
//  ContentView.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 3/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(AppController.self) private var appController: AppController
    
    var body: some View {
        @Bindable var dataModel = appController.dataModel
        
        
        VStack {
            importButton
            HSplitView {
                SourceList(nodes: $dataModel.rootNodes, 
                           selectionManager: appController.selectionManager)
                    .padding()
                    .frame(maxHeight: .infinity)
                VStack {
                    ItemsTable(items: dataModel.visibleItems, selectionManager: appController.selectionManager)
                        .padding()
                    Text("Detail View")
                        .padding()
                }
                .frame(maxHeight: .infinity)
                InspectorView()
                    .padding()
                    .frame(maxHeight: .infinity)
            }
            .frame(maxHeight: .infinity)
        }
        .padding()
        .onAppear() {
        #if DEBUG
            try? appController.dataModel.modelContext.delete(model: Node.self)
            try? appController.dataModel.modelContext.delete(model: ImageItem.self)
        #endif
        }
    }

    
    @ViewBuilder
    var importButton: some View {
        Button("Select URL") {
            let panel = NSOpenPanel()
            panel.canChooseFiles = false
            panel.canChooseDirectories = true
            panel.allowsMultipleSelection = false
            
            if panel.runModal() == .OK {
                if let url = panel.url {
                    appController.dataModel.importDirectory(url, intoNode: nil)
                }
            }

        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
