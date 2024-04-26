//
//  AppController.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/10/24.
//

import Foundation

@Observable
class AppController {
    var dataModel: DataModel
    
    var selectionManager: SelectionManager
    
    var imageContentVM: ImageContentViewModel
    
    init() {
        let localDataModel = DataModel()
        let localSelectionManager = SelectionManager()
        
        dataModel = localDataModel
        selectionManager = localSelectionManager
        
        imageContentVM = ImageContentViewModel(dataModel: localDataModel, selectionManager: localSelectionManager)
        
        selectionManager.delegate = self
    }
    
}

extension AppController: SelectionManagerDelegate {
    func selectedImageItemIDsDidChange(_ imageItemIDs: Set<ImageItem.ID>) {
        dataModel.selectedImageItemsIds = Array(imageItemIDs)
    }
    
    func selectedNodesDidChange(_ node: Set<Node>) {
        let sort = SortDescriptor<Node>(\.name)
        dataModel.selectedNodes = Array(node).sorted(using: sort)
    }
    
    
}
