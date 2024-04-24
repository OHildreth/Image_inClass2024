//
//  ImageItemInspector.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/24/24.
//

import SwiftUI


struct ImageItemInspector: View {
    var imageItems: [ImageItem]
    
    var body: some View {
        Text("Image Item Inspector")
    }
    
    
    private func fileSizeFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumSignificantDigits = 3
        formatter.minimumSignificantDigits = 3
        
        return formatter
    }
    
    private func formattedFileSize(_ fileSize: Int) -> String {
        let size = Double(fileSize) / 1_048_576
        
        let sizeNumber = NSNumber(value: size)
        
        return fileSizeFormatter().string(from: sizeNumber) ?? "N/A"
    }
}
