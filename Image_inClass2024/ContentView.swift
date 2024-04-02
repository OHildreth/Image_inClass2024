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
            HSplitView {
                SourceList(nodes: nodes)
                    .padding()
                VStack {
                    ItemsTable(items: nodes.first?.items ?? [])
                        .padding()
                    Text("Detail View")
                        .padding()
                }
                Text("Inspector")
                    .padding()
            }
        }
        .padding()
        
        
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
