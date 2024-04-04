//
//  CustomColorCodes.swift
//  GroceryShopper
//
//  Created by Pursuit on 4/4/24.
//

import Foundation
import SwiftUI

enum CustomColorCodes {
    case primary
    case success
    case failure
    case bgColor
    case titleText
    case textFieldBG
    case activeButtonBG
    case inActiveButtonBG
}

extension CustomColorCodes {
    var color: Color {
        switch self {
        case .primary:
            return Color(red: 79/255, green: 139/255, blue: 43/255)
        case .success:
            return Color(red: 0, green: 0, blue: 0)
        case .failure:
            return Color(red: 219/255, green: 12/255, blue: 12/255)
        case .bgColor:
            return Color(uiColor: .init(named: "BGColor") ?? .green)
        case .titleText:
            return Color(uiColor: .init(named: "TitleTextColor") ?? .white)
        case .textFieldBG:
            return Color(uiColor: .init(named: "TextFieldBG") ?? .black)
        case .activeButtonBG:
            return Color(uiColor: .init(named: "ActiveButtonBG") ?? .black)
        case .inActiveButtonBG:
            return Color(uiColor: .init(named: "InActiveButtonBG") ?? .black)
        }
    }
}
