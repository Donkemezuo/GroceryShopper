//
//  InputTextFieldWithErrorHandling.swift
//  GroceryShopper
//
//  Created by Pursuit on 4/4/24.
//

import SwiftUI

enum InputTextFieldWithInlineErrorUse {
    case username
    case email
    case password
    var placeholderText: String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .username:
            return "Username"
        }
        
    }
    
}

struct InputTextFieldWithInlineError: View {
    @Binding var inputText: String
    @Binding var errorMessage: String
    var usecase: InputTextFieldWithInlineErrorUse
    
    var body: some View {
        
        VStack {
            switch usecase {
            case .username, .email:
                TextField(usecase.placeholderText, text: $inputText)
                    .padding()
                    .background(CustomColorCodes.textFieldBG.color)
                    .font(CustomFonts.textField.font)
                    .cornerRadius(5.0)
                    .keyboardType(.default)
            case .password:
                SecureField(usecase.placeholderText, text: $inputText)
                    .padding()
                    .background(CustomColorCodes.textFieldBG.color)
                    .font(CustomFonts.textField.font)
                    .cornerRadius(5.0)
                    .keyboardType(.default)
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .fontWeight(.light)
                    .foregroundStyle(CustomColorCodes.failure.color)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .accessibilityHint("Double check login credentials")
                    .accessibilityLabel("\(errorMessage) encountered while signing in")
            }
        }
    }
}

#Preview {
    InputTextFieldWithInlineError(inputText: .constant(""), errorMessage: .constant(""), usecase: .email)
}
