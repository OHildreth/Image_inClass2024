//
//  ImageContent.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/26/24.
//

import SwiftUI

struct ImageContent: View {
    @Environment(AppController.self) private var appController: AppController
    
    var body: some View {
        VSplitView {
            ItemsTable(imageContentVM: appController.imageContentVM)
            ImageDetailView(imageItems: appController.dataModel.selectedImageItems)
            
        }
    }
}

#Preview {
    ImageContent()
}
