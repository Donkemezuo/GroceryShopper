//
//  ContentView.swift
//  GroceryShopper
//
//  Created by Pursuit on 4/4/24.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel = SignupViewModel()
    
    var body: some View {
        ZStack {
            CustomColorCodes.bgColor.color
            
            VStack {
                Text("Green Grocery")
                    .font(CustomFonts.title.font)
                    .foregroundStyle(CustomColorCodes.titleText.color)
                    .accessibilityLabel("Green Grocery")
                    .accessibilityAddTraits(.isStaticText)
                
                VStack (spacing: 20) {
                    InputTextFieldWithInlineError(
                        inputText: $viewModel.username,
                        errorMessage: $viewModel.usernameErrorMessage,
                        usecase: .username)
                    
                    InputTextFieldWithInlineError(
                        inputText: $viewModel.email,
                        errorMessage: $viewModel.emailErrorMessage,
                        usecase: .email)
                    
                    InputTextFieldWithInlineError(
                        inputText: $viewModel.password,
                        errorMessage: $viewModel.passwordErrorMessage,
                        usecase: .password)
                    
                    HStack {
                        Button("Sign up") {
                            print("Sign up button pressed")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.shouldEnableSignupButton ? CustomColorCodes.activeButtonBG.color : CustomColorCodes.inActiveButtonBG.color)
                        .foregroundStyle(.white)
                        .cornerRadius(5)
                        .accessibilityLabel("Sign up button")
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    
                }.padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea(.all)
        
    }
}


#Preview {
    SignupView()
}
