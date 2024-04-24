//
//  DataModel_ImportError.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/24/24.
//

import Foundation

extension DataModel {
    enum ImportError: Error {
        case cannotImportFileWithoutANode
        case noURLsToImport
    }
}
