//
//  SignupViewModel.swift
//  GroceryShopper
//
//  Created by Pursuit on 4/4/24.
//

import Foundation
import Combine

final class SignupViewModel: ObservableObject {
    @Published var username: String = ""
    var usernameErrorMessage: String = ""
    
    @Published var email: String = ""
    var emailErrorMessage: String = ""
    
    @Published var password: String = ""
    var passwordErrorMessage: String = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    private var usernameValidPublisher: AnyPublisher<Bool, Never> {
        return $username
            .map { !$0.isEmpty } // Returns true if username field is not empty
            .eraseToAnyPublisher() // Casting mapped result bool to publisher object
    }
    
    private var emailRequiredPublisher: AnyPublisher<(email: String, isValid: Bool), Never> {
        return $email
            .map {(email: $0, isValid: !$0.isEmpty) }
            .eraseToAnyPublisher()
    }
    
    private var emailValidPublisher: AnyPublisher<(email: String, isValid: Bool), Never> {
        return emailRequiredPublisher
            .filter{$0.isValid } // Only after required is valid
            .map {(email: $0.email, isValid: $0.email.isValidEmail())}
            .eraseToAnyPublisher()
    }
    
    private var passwordRequiredPublisher: AnyPublisher<(password: String, isValid: Bool), Never> 
    {
        return $password
            .map {(password: $0, isValid: !$0.isEmpty) }
            .eraseToAnyPublisher()
    }
    
    private var passwordValidPublisher: AnyPublisher<Bool, Never> {
        return passwordRequiredPublisher
            .filter{ $0.isValid } // Only after required is valid
            .map { $0.password.isValidPassword()}
            .eraseToAnyPublisher()
    }
    
    init() {
        // Wrapping the response to publisher with corresponding message
        usernameValidPublisher
            .receive(on: RunLoop.main) // Notify on the main thread
            .dropFirst()
            .map {$0 ? "" : "username is not valid" }
            .assign(to: \.usernameErrorMessage, on: self)
            .store(in: &cancellable)
        
        emailRequiredPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map {$0.isValid ? "" : "Email is missing "}
            .assign(to: \.emailErrorMessage, on: self)
            .store(in: &cancellable)
        
        emailValidPublisher
            .receive(on: RunLoop.main)
            .map {$0.isValid ? "" : "Email is not valid"}
            .assign(to: \.emailErrorMessage, on: self)
            .store(in: &cancellable)
        
        passwordRequiredPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map {$0.isValid ? "" : "Password is missing"}
            .assign(to: \.passwordErrorMessage, on: self)
            .store(in: &cancellable)
        
        passwordValidPublisher
            .receive(on: RunLoop.main)
            .map {$0 ? "" : "Password must be 8 characters with at least 1 alphabet and 1 number"}
            .assign(to: \.passwordErrorMessage, on: self)
            .store(in: &cancellable)
    }
    
    var shouldEnableSignupButton: Bool {
        return usernameErrorMessage.isEmpty && emailErrorMessage.isEmpty && passwordErrorMessage.isEmpty
    }
    
}
