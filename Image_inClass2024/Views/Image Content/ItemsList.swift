//
//  ItemsList.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/26/24.
//

import SwiftUI
import SwiftData

struct ItemsList: View {
    @Bindable var imageContentVM: ImageContentViewModel
    
    var body: some View {
        List(imageContentVM.imageItems, id: \.id, selection: $imageContentVM.selection) { imageItem in
            HStack {
                AsyncImage(url: imageItem.url) {image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
            }
            
        }
    }
}

/*
 #Preview {
     ItemsList(imageContentVM: <#ImageContentViewModel#>)
 }
 */

