//
//  ImageItem.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 3/27/24.
//

import Foundation
import SwiftData

@Model
final class ImageItem: Identifiable {
    var id: UUID
    
    var name: String
    
    var url: URL
    
    var node: Node?
    
    init(url: URL) {
        self.id = UUID()
        
        self.url = url
        
        self.name = url.deletingPathExtension().lastPathComponent
    }
}
