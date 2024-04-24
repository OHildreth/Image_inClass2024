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
    
    // TODO: Update
    @State var visibility_sourceList: NavigationSplitViewVisibility = .all
    
    @AppStorage("visibility_inspector") private var visibility_inspector = true
    
    var body: some View {
        @Bindable var dataModel = appController.dataModel
        NavigationSplitView(columnVisibility:$visibility_sourceList) {
            SourceList(dataModel: appController.dataModel,
                       selectionManager: appController.selectionManager)
            .padding()
            .frame(maxHeight: .infinity)
        } detail: {
            VStack {
                ItemsTable(items: dataModel.visibleItems, selectionManager: appController.selectionManager)
                    //.padding()
                Text("Detail View")
                    .padding()
            }
            .frame(maxHeight: .infinity)
        }.inspector(isPresented: $visibility_inspector) {
            InspectorView(dataModel: dataModel)
                .padding()
                .frame(maxHeight: .infinity)
                .toolbar {
                    ToolbarItem(id: "inspector") {
                        Button {
                            visibility_inspector.toggle()
                        } label: {
                            Image(systemName: "sidebar.right")
                        }
                    }
                }
        }
        .frame(maxHeight: .infinity)
        //.padding()
        .onAppear() {
        #if DEBUG
            try? appController.dataModel.modelContext.delete(model: Node.self)
            try? appController.dataModel.modelContext.delete(model: ImageItem.self)
        #endif
        }
    }
    
    /*
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
     */
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
