//
//  ImageDetailView.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/26/24.
//

import SwiftUI

struct ImageDetailView: View {
    var imageItems: [ImageItem] = []
    
    
    var body: some View {
        ScrollView(.horizontal) {
            ForEach(imageItems, id: \.id) { nextItem in
                if let image = NSImage(contentsOf: nextItem.url) {
                    Image(nsImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("\(nextItem.name) Could Not Be Found")
                }
            }
        }
        .frame(minHeight: 300, maxHeight: .infinity)
    }
}


