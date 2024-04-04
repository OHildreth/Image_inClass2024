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
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
    }
    
    func importDirectory(_ url: URL, intoNode parentNode: Node?) {
        guard let localModelContext = modelContext else { return }
        
        let type = URL.URLType(withURL: url)
        
        if type != .directory {return}
        
        
        let newNode = Node(withURL: url, parentNode)
        
        localModelContext.insert(newNode)
        
        if let parentNode {
            if parentNode.subNodes != nil {
                parentNode.subNodes?.append(newNode)
            } else {
                parentNode.subNodes = []
                parentNode.subNodes?.append(newNode)
            }
        }
        
        var subdirectories: [URL] = []
        var files: [URL] = []
        
        if let contentURLs = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: [.isRegularFileKey]) {
            for nextURL in contentURLs {
                let nextType = URL.URLType(withURL: nextURL)
                
                switch nextType {
                case .directory:
                    subdirectories.append(nextURL)
                case .file:
                    files.append(nextURL)
                case .fileDoesNotExist:
                    continue
                }
            }
        }
            
         
        for nextFile in files {
            self.importFile(nextFile, intoNode: newNode)
        }

        for nextDirectory in subdirectories {
            self.importDirectory(nextDirectory, intoNode: newNode)
        }
        
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
