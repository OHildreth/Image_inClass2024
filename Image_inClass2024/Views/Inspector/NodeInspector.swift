//
//  NodeInspector.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/22/24.
//

import SwiftUI

struct NodeInspector: View {
    var nodes: [Node]
    
    var body: some View {
        nodeNameEditor()
    }
    
    @ViewBuilder
    private func nodeNameEditor() -> some View {
        switch nodes.count {
        case 0: emptyNodesEditor()
        case 1: oneNodeEditor()
        default: multipleNodeEditor()
        }
    }
    
    @ViewBuilder
    private func emptyNodesEditor() -> some View {
        VStack(alignment: .center) {
            Text("No Groups Selected")
            Text("Select a Group from the Sidebar")
        }
    }
    
    @ViewBuilder
    private func oneNodeEditor() -> some View {
        if let editableNode = nodes.first {
            @Bindable var bindableNode = editableNode
            
            VStack {
                HStack {
                    Text("Name")
                    TextField("Name", text: $bindableNode.name)
                }
                
                imageNumber()
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func multipleNodeEditor() -> some View {
        VStack {
            Text("\(nodes.count) Groups Selected")
            Text("Cannot Edit Multilple Groups")
            
            imageNumber()
        }
    }
    
    
}

extension NodeInspector {
    @ViewBuilder
    private func imageNumber() -> some View {
        let nodeCount = nodes.count
        let imageCount = nodes.reduce(0, {current, nextNode in
            current + nextNode.flattenedImageItems().count
        } )
        
        let imageCountString = String(imageCount)
        let imageString = "Image".pluralize(imageCount)
        
        let nodeString = "in selected" + "Group".pluralize(nodeCount)
                                    
        let output = imageCountString + " " + imageString + " " + nodeString
        
        Text(output)
            .lineLimit(0)
        
    }
}

/*
 #Preview {
     NodeInspector()
 }
 */

