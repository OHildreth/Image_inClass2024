//
//  ImageContent.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/26/24.
//

import SwiftUI

struct ImageContent: View {
    @Environment(AppController.self) private var appController: AppController
    
    @AppStorage("imageContentViewState") var imageContentViewState: ImageContentViewState = .table
    
    var body: some View {
        VSplitView {
            itemsView
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
            ImageDetailView(imageItems: appController.dataModel.selectedImageItems)
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
        }
        .toolbar {
            ToolbarItem(id: "ImageViewSelection", placement: .principal) {
                Picker("Images", selection: $imageContentViewState) {
                    ForEach(ImageContentViewState.allCases) { state in
                        Image(systemName: state.systemName)
                    }
                }.pickerStyle(.inline)
            }
        }
    }
    
    @ViewBuilder
    var itemsView: some View {
        switch imageContentViewState {
        case .table:
            ItemsTable(imageContentVM: appController.imageContentVM)
        case .list:
            ItemsList(imageContentVM: appController.imageContentVM)
        case .grid:
            ImageGrid(imageContentVM: appController.imageContentVM)
        }
    }
}

#Preview {
    ImageContent()
}
