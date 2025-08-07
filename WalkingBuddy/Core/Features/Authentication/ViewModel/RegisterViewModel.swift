//
//  RegisterViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Foundation

@MainActor
class RegisterViewModel: ObservableObject {
    var authViewModel: AuthViewModel?

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""

    @Published var firstNameError = ""
    @Published var lastNameError = ""
    @Published var emailError = ""
    @Published var passwordError = ""
    @Published var confirmPasswordError = ""
    @Published var errorMessage: String?

    @Published var showError = false

    func register() {
        showError = false
        firstNameError = ""
        lastNameError = ""
        emailError = ""
        passwordError = ""
        confirmPasswordError = ""

        if firstName.isEmpty {
            firstNameError = "First name is required"
            showError = true
        }

        if lastName.isEmpty {
            lastNameError = "Last name is required"
            showError = true
        }

        if email.isEmpty {
            emailError = "Email is required"
            showError = true
        } else if !email.isValidEmail() {
            emailError = "Invalid email format"
            showError = true
        }

        if password.isEmpty {
            passwordError = "Password is required"
            showError = true
        } else if password.count < 8 {
            passwordError = "Password must be at least 8 characters"
            showError = true
        }

        if confirmPassword != password {
            confirmPasswordError = "Passwords do not match"
            showError = true
        }

        guard !showError else { return }

        // If everything is valid, proceed
        Task {
                    do {
                        _ = try await ApiService.shared.registerUser(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            password: password
                        )

                        authViewModel?.onRegisterSuccess()

                    } catch {
                        print("Error registering user: \(error.localizedDescription)")
                        self.errorMessage = error.localizedDescription
                        self.showError = true
                    }
                }
    }
    

}


