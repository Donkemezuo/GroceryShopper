//
//  SignupViewModel.swift
//  GroceryShopper
//
//  Created by Pursuit on 4/4/24.
//

import Foundation

final class SignupViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var usernameErrorMessage: String = ""
    
    @Published var email: String = ""
    @Published var emailErrorMessage: String = ""
    
    @Published var password: String = ""
    @Published var passwordErrorMessage: String = ""
    
    var shouldEnableSignupButton: Bool {
        return usernameErrorMessage.isEmpty && emailErrorMessage.isEmpty && passwordErrorMessage.isEmpty
    }
    
}
