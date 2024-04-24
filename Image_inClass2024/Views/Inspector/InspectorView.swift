//
//  InspectorView.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/19/24.
//

import SwiftUI

struct InspectorView: View {
    
    var dataModel: DataModel
    
    
    var body: some View {
        TabView {
            NodeInspector(nodes: dataModel.selectedNodes)
                .tabItem( {Text("􀈕")} )
            ImageItemInspector(imageItems: dataModel.selectedImageItems)
                .tabItem( {Text("􀏅")} )
        }
            }
}

/*
 #Preview {
     InspectorView()
 }
 */

