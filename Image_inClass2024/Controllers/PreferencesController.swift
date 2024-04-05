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
    var allowedImageFileExtensions: [AllowedFileExtension] {
        didSet {
            save()
        }
    }
    
    init() {
        let fileExtensionStrings = UserDefaults.standard.value(forKey: UserDefaults.allowedImageExtensions) as? [String] ?? []
        
        self.allowedImageFileExtensions = []
        
        self.allowedImageFileExtensions = extensions(fromStrings: fileExtensionStrings).sorted(by: {$0.fileExtension < $1.fileExtension})
    }
    
    private func extensions(fromStrings strings: [String]) -> [AllowedFileExtension] {
        var allowedExtensions: [AllowedFileExtension] = []
        
        for nextString in strings {
            let nextExtension = AllowedFileExtension(fileExtension: nextString)
            allowedExtensions.append(nextExtension)
        }
        
        return allowedExtensions
    }
    
    
    private func extensionStrings(_ extensions: [AllowedFileExtension]) -> [String] {
        var output: [String] = []
            for nextExtension in extensions {
                output.append(nextExtension.fileExtension)
        }
        
        return output
    }
    
    
    func save() {
        let extensionToSave = self.extensionStrings(self.allowedImageFileExtensions)
        
        UserDefaults.standard.setValue(extensionToSave, forKey: UserDefaults.allowedImageExtensions)
    }
    
    
    func addExtension() {
        let newExtension = AllowedFileExtension()
        allowedImageFileExtensions.append(newExtension)
    }
    
    func removeExtensions(_ fileExtensions: [AllowedFileExtension]) {
        for nextExtension in fileExtensions {
            self.allowedImageFileExtensions.removeAll(where: {$0.fileExtension == nextExtension.fileExtension})
        }
    }
    
    
    
}


struct AllowedFileExtension: Identifiable, Codable, Hashable {
    // UPDATE
    var id = ID()
    
    var fileExtension: String = "NewExtension"
    
    // ADD
    struct ID: Identifiable, Codable, Hashable {
        var id = UUID()
    }
}
