//
//  PreferencesController.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/3/24.
//

import Foundation
import Observation

@Observable
class PreferencesController {
    var allowedImageFileExtension: [AllowedFileExtension]
    
    init(allowedImageFileExtension: [AllowedFileExtension]) {
        self.allowedImageFileExtension = allowedImageFileExtension
    }
}


struct AllowedFileExtension: Identifiable, Codable, Hashable {
    // UPDATE
    var id = ID()
    
    var fileExtension: String = "Extension"
    
    // ADD
    struct ID: Identifiable, Codable, Hashable {
        var id = UUID()
    }
}
