//
//  ItemsTable.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import SwiftUI
import SwiftData

struct ItemsTable: View {
    @Bindable var imageContentVM: ImageContentViewModel
    
    var body: some View {
        Table(imageContentVM.imageItems, selection: $imageContentVM.selection, sortOrder: $imageContentVM.sort) {
            TableColumn("Name", value: \.name)
            TableColumn("Folder", value: \.nodeName)
            TableColumn("Open in Finder", value: \.url.relativePath) { imageItem in
                HStack {
                    Spacer()
                    Button(action: {imageItem.url.showInFinder()}, label: {Image(systemName: "link")})
                }
                
            }
        }
    }
}

/*
 #Preview {
     ItemsTable(items: [], )
 }
 */

