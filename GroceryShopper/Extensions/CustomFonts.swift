//
//  CustomFonts.swift
//  GroceryShopper
//
//  Created by Pursuit on 4/4/24.
//

import Foundation
import SwiftUI

enum CustomFonts {
    case title
    case textField
    case button
    
    var font: Font {
        switch self {
        case .title:
            return .custom("Noteworthy-Bold", size: 40, relativeTo: .title) // Adding dynamic size in the text
        case .textField:
            return .custom("Noteworthy-Bold", size: 16, relativeTo: .subheadline)
        case .button:
            return .custom("Noteworthy-Bold", size: 20, relativeTo: .headline)
        }
    }
}
