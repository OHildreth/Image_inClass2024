//
//  SourceList.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/1/24.
//

import SwiftUI
import SwiftData

struct SourceList: View {
    var nodes: [Node] = []
    
    var body: some View {
        List() {
            OutlineGroup(nodes, children: \.subNodes) { nextNode in
                HStack {
                    Image(systemName: "folder.fill")
                    Text(nextNode.name)
                    Text(nextNode.parent?.name ?? "No Parent")
                    Text("\(nextNode.subNodes?.count ?? 0)")
                }
            }
        }

    }
}

#Preview {
    SourceList()
}
