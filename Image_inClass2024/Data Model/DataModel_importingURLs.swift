//
//  DataModel_importingURLs.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/8/24.
//

import Foundation


extension DataModel {
    func importDirectory(_ url: URL, intoNode parentNode: Node?) {
        
        let type = URL.URLType(withURL: url)
        
        if type != .directory {return}
        
        
        let newNode = Node(withURL: url, parentNode)
        
        modelContext.insert(newNode)
        
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
            
            fetchData()
        }
            
         
        for nextFile in files {
            self.importFile(nextFile, intoNode: newNode)
        }

        for nextDirectory in subdirectories {
            self.importDirectory(nextDirectory, intoNode: newNode)
        }
        
    }
    
    
    private func importFile(_ url: URL, intoNode parentNode: Node) {
       
        let type = URL.URLType(withURL: url)
        
        if type != .file {
            return
        }
        
        guard let allowedExtensions = UserDefaults.standard.object(forKey: UserDefaults.allowedImageExtensions) as? [String] else {
            print("ERROR NEEDED: no allowed extension")
            return
        }
        
        if (allowedExtensions.contains(where: {$0.caseInsensitiveCompare(url.pathExtension) == .orderedSame }) == false) {
            return
        }
        
        
        let newItem = ImageItem(url: url)
        
        modelContext.insert(newItem)
        
        newItem.node = parentNode
    }
}
