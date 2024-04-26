//
//  URL_showInFinder.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/26/24.
//

import Foundation
import Cocoa

extension URL {
    func showInFinder() {
        NSWorkspace.shared.activateFileViewerSelecting([self])
    }
}

extension Collection where Element == URL {
    func showInFinder() {
        NSWorkspace.shared.activateFileViewerSelecting(map {$0})
    }
}
