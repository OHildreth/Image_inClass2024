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
                .frame(width: 50, height: 75)
                .clipped()
                Text(imageItem.name)
                    .padding(.horizontal)
                Text(imageItem.nodeName)
                    .padding(.horizontal)
                Button(action: {imageItem.url.showInFinder()}, label: {Image(systemName: "link")})
                
            }
            
            
            
        }
    }
}

/*
 #Preview {
     ItemsList(imageContentVM: <#ImageContentViewModel#>)
 }
 */

