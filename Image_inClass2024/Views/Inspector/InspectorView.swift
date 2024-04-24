//
//  InspectorView.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/19/24.
//

import SwiftUI

struct InspectorView: View {
    var body: some View {
        TabView {
            Text("Node Inspector")
                .tabItem( {Text("􀈕")} )
            Text("Image Inspector")
                .tabItem( {Text("􀏅")} )
        }
            }
}

#Preview {
    InspectorView()
}
