//
//  SelectionManager.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/10/24.
//

import Foundation

@Observable
class SelectionManager {
    
    @ObservationIgnored var delegate: SelectionManagerDelegate?
    
    
    var selectedNodes: Set<Node> = [] {
        didSet {
            delegate?.selectedNodesDidChange(selectedNodes)
        }
    }
}

protocol SelectionManagerDelegate {
    func selectedNodesDidChange(_ node: Set<Node>)
}
