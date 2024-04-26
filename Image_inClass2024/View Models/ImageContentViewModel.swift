//
//  ImageContentViewModel.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/26/24.
//

import Foundation

import SwiftUI
import SwiftData
import OrderedCollections

@Observable
class ImageContentViewModel {
    private var dataModel: DataModel
    
    private var selectionManager: SelectionManager
    
    // TODO: Likely Bug
    var selection: Set<ImageItem.ID> = [] {
        didSet {
            selectionManager.selectedImageItemIDs = selection
        }
    }
    
    var imageItems: [ImageItem] {
        visibleItems()
    }
    
    var sort: [KeyPathComparator<ImageItem>] = [.init(\.name)]
    
    init(dataModel: DataModel, selectionManager: SelectionManager) {
        self.dataModel = dataModel
        self.selectionManager = selectionManager
    }
    
    private func visibleItems() -> [ImageItem] {
        var items: OrderedSet<ImageItem> = []
        
        for nextNode in dataModel.selectedNodes {
            items.append(contentsOf: nextNode.flattenedImageItems())
        }
        
        return Array(items).sorted(using: sort)
    }
    
    
    func shouldAllowDrop(ofURls urls: [URL]) -> Bool {
        if urls.isEmpty {return false}
        
        let numberOfNodes = selectionManager.selectedNodes.count
        
        switch numberOfNodes {
        case 0: return false
        case 1: return true
        default: return false
        }
    }
}
