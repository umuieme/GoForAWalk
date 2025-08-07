//
//  LoginViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {

    var authViewModel: AuthViewModel?

    @Published var email = ""
    @Published var password = ""
    @Published var emailError: String = ""
    @Published var passwordError: String = ""

    @Published var showError = false

    func loginWithEmailPassword() async {
        showError = false
        emailError = ""
        passwordError = ""
        if email.isEmpty {
            emailError = "Email must be filled"
            showError = true
        }

        if !email.isValidEmail() {
            emailError = "Email must be valid"
            showError = true
        }

        if password.isEmpty {
            passwordError = "Password must be filled"
            showError = true
        } else if password.count < 8 {
            passwordError = "Password length must be 8 or more"
            showError = true
        }

        guard !showError else {
            return
        }
        do  {
            
            let response = try await ApiService.shared.loginWithEmail(email: email, password: password)
            
            authViewModel?.onLoginSuccess()

        } catch let error{
            print("Error: \(error)")
        }
    }
}
