//
//  ImageContentViewState.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/29/24.
//

import Foundation

import SwiftUI

enum ImageContentViewState: Int, Codable, Identifiable, CaseIterable {
    var id: Self { self }
    
    case table
    case list
    case grid
}


extension ImageContentViewState {
    var systemName: String {
        switch self {
        case .table: return "tablecells"
        case .list: return "list.bullet"
        case .grid: return "square.grid.3x3"
        }
    }
}
