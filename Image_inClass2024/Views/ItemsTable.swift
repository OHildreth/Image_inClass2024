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
    
    var body: some View {
        Table(items) {
            TableColumn("Name", value: \.name)
        }
    }
}

#Preview {
    ItemsTable(items: [])
}
