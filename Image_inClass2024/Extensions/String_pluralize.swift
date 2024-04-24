//
//  String_pluralize.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 4/22/24.
//

import Foundation


extension String {
    func pluralize(_ count: Int) -> String {
        var attributed = AttributedString(localized: "^[\\(count) \\(self)](inflect: true)" )
        
        guard let range = attributed.range(of: "\\(count)") else {return self}
        
        attributed.removeSubrange(range)
        
        return String(attributed.characters)
    }
}

extension NumberFormatter {
    static var spelledNumberFormater: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        return formatter
    }()
}

extension Numeric {
    var spelledout: String? {
        NumberFormatter.spelledNumberFormater.string(for: self)
    }
}

