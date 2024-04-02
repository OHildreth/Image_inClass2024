//
//  Node.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 3/27/24.
//

import Foundation
import SwiftData

@Model
final class Node: Identifiable {
    var id: UUID
    
    var name: String
    
    
    @Relationship(deleteRule: .cascade, inverse: \ImageItem.node)
    var items: [ImageItem]
    
    var parent: Node? {
        didSet {
            self.nodeType = calculateNodeType(withParent: parent)
        }
    }
    
    
    @Relationship(deleteRule: .cascade, inverse: \Node.parent)
    var subNodes: [Node]?
    
    var nodeType: Int
    
    init(name: String, _ parent: Node?) {
        self.id = UUID()
        self.name = name
        self.items = []
        self.subNodes = []
        self.nodeType = 0
        
        self.parent = parent
        self.nodeType = calculateNodeType(withParent: parent)
    }
    
    convenience init(withURL url: URL, _ parent: Node?) {
        let urlName = url.deletingPathExtension().lastPathComponent
        
        self.init(name: urlName, parent)
    }
    
    func calculateNodeType(withParent localParent: Node?) -> Int {
        if localParent == nil {
            return 0
        } else {
            return 1
        }
    }
    
    
    func flattenedImageItems() -> [ImageItem] {
        var localItems: [ImageItem] = self.items
        
        guard let localSubNodes = self.subNodes else {
            return localItems
        }
        
        for nextSubNode in localSubNodes {
            localItems.append(contentsOf: nextSubNode.flattenedImageItems())
        }
        
        return localItems
    }

    
}
