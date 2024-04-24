//
//  DataModel.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import Foundation
import SwiftUI
import SwiftData

import OrderedCollections

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
            getAllImageItemsFromSelectedNodes()
        }
    }
    
    
    private func getAllImageItemsFromSelectedNodes() -> [ImageItem] {
        var items: OrderedSet<ImageItem> = []
        
        for nextNode in selectedNodes {
            items.append(contentsOf: nextNode.flattenedImageItems())
        }
        
        return Array(items)

    }
    
    @Transient
    var selectedImageItems: [ImageItem] = []
    
    @Transient
    var selectedImageItemsIds: [ImageItem.ID] = [] {
        didSet {
            updateImageItems()
        }
        
    }
    
    private func updateImageItems() {
        let ids = selectedImageItemsIds
        
        let items = self.visibleItems
        
        let filteredItems = items.filter( { ids.contains([$0.id]) } )
        
        selectedImageItems = filteredItems
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
        
        fetchData()
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
