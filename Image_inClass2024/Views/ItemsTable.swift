//
//  ItemsTable.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import SwiftUI
import SwiftData

struct ItemsTable: View {
    var items: [ImageItem]
    
    @Bindable var selectionManager: SelectionManager
    
    var body: some View {
        Table(items, selection: $selectionManager.selectedImageItemIDs) {
            TableColumn("Name", value: \.name)
        }
    }
}

/*
 #Preview {
     ItemsTable(items: [], )
 }
 */

