//
//  DataModel.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class DataModel {
    
    private var container: ModelContainer
    
    var modelContext: ModelContext
    
    var rootNodes: [Node] = []
    
    var sortNodesKeyPaths: [KeyPathComparator<Node>] = [.init(\.name)]
    
    
    @Transient
    var selectedNodes: [Node] = []
    
    
    @Transient
    var visibleItems: [ImageItem] {
        get {
            var items: [ImageItem] = []
            
            for nextNode in selectedNodes {
                items.append(contentsOf: nextNode.flattenedImageItems())
            }
            
            return items
        }
    }
    
    
    init() {
        let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Node.self, ImageItem.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        container = sharedModelContainer
        
        modelContext = ModelContext(sharedModelContainer)
    }
    
    
    // MARK: - Fetching Data
    func fetchData() {
        do {
            let sortOrder = [SortDescriptor<Node>(\.name)]
            let predicate = #Predicate<Node>{ $0.nodeType == 0 }
            
            let descriptor = FetchDescriptor(predicate: predicate, sortBy: sortOrder)
            
            rootNodes = try modelContext.fetch(descriptor)
        } catch {
            print("ERROR: Fetch Failed")
        }
    }
    
    
    
}
