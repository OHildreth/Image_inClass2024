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
    var modelContext: ModelContext?
    
    
    func importDirectory(_ url: URL, intoNode parentNode: Node? {
        
    }
    
    
    func importFile(_ url: URL, intoNode parentNode: Node) {
        guard let localModelContext = modelContext else { return }
        
        let type = URL.URLType(withURL: url)
        
        if type != .file {
            return
        }
        
        let newItem = ImageItem(url: url)
        
        localModelContext.insert(newItem)
        
        newItem.node = parentNode
    }
    
}
