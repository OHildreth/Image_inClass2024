//
//  ContentView.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 3/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    
    @Query(filter: #Predicate<Node>{ $0.nodeType == 0 }, sort: [SortDescriptor(\Node.name)])
    private var nodes: [Node]
    
    private var rootNodes: [Node] {nodes.filter({$0.nodeType == 0})}

    
    var body: some View {
        VStack {
            HStack {
                importButton
                Text("Nodes: \(nodes.count)")
                Text("Root Nodes: \(rootNodes.count)")
            }
            HSplitView {
                SourceList(nodes: nodes)
                    .padding()
                    .frame(maxHeight: .infinity)
                VStack {
                    ItemsTable(items: nodes.first?.items ?? [])
                        .padding()
                    Text("Detail View")
                        .padding()
                }
                .frame(maxHeight: .infinity)
                Text("Inspector")
                    .padding()
                    .frame(maxHeight: .infinity)
            }
            .frame(maxHeight: .infinity)
        }
        .padding()
        .onAppear() {
        #if DEBUG
            try? modelContext.delete(model: Node.self)
            try? modelContext.delete(model: ImageItem.self)
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
            
            let dataModel = DataModel(modelContext: modelContext)
            if panel.runModal() == .OK {
                if let url = panel.url {
                    dataModel.importDirectory(url, intoNode: nil)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
