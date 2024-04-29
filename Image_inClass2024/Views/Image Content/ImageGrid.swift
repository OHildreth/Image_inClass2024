//
//  ImageGrid.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/29/24.
//

import SwiftUI

struct ImageGrid: View {
    @Bindable var imageContentVM: ImageContentViewModel
    
    // Define grid columns
    var columns = [ GridItem(.adaptive(minimum: 200, maximum: 300), spacing: 0) ]
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(imageContentVM.imageItems) { imageItem in
                    
                    VStack(alignment: .center) {
                        AsyncImage(url: imageItem.url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.frame(minWidth: 100, height: 150)
                                .border(Color.blue, width: selectionWidth(forItem: imageItem))
                                
                        } placeholder: {
                            ProgressView()
                        }
                        Text(imageItem.name)
                    }
                    
                    .padding()

                    .gesture(TapGesture().modifiers([.command]).onEnded({
                        imageContentVM.imageTappedWithModifiers(imageItem)
                    }))
                    .gesture(TapGesture().modifiers([.shift]).onEnded({
                        imageContentVM.imageTappedWithModifiers(imageItem)
                    }))
                    .gesture(TapGesture().modifiers([.control]).onEnded({
                        imageContentVM.imageTappedWithModifiers(imageItem)
                    }))
                    .gesture(TapGesture().modifiers([.command, .control]).onEnded({
                        imageContentVM.imageTappedWithModifiers(imageItem)
                    }))
                    .gesture(TapGesture().modifiers([]).onEnded({
                        print("Tapped")
                        imageContentVM.imageItemTapped(imageItem)
                    }))
                }
            }
            .padding()
        }
        .onTapGesture {
            print("Tapped in Empty Space")
            imageContentVM.selection = []
        }
        
        
    }
        
    
    
    
    func selectionWidth(forItem item:ImageItem) -> Double {
        if imageContentVM.itemIsSelected(item) {
            return 4.0
        } else {
            return 0.0
        }
    }
}



/*
 #Preview {
     ImageGrid()
 }
 */

