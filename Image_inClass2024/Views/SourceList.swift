//
//  SourceList.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import SwiftUI
import SwiftData

struct SourceList: View {
    @Binding var nodes: [Node]
    
    @Bindable var selectionManager: SelectionManager
    
    var body: some View {
        List(selection: $selectionManager.selectedNodes) {
            OutlineGroup($nodes, id:\.self, children: \.subNodes) { $nextNode in
                HStack {
                    Image(systemName: "folder.fill")
                    TextField("Name", text: $nextNode.name)
                    Text(nextNode.name)
                    
                }
            }
        }

    }
}


/*
 #Preview {
     SourceList()
 }
 */

