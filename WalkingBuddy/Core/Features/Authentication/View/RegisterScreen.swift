//
//  RegisterScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-20.
//

import SwiftUI

struct RegisterScreen: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var registerViewModel = RegisterViewModel()

    var body: some View {
        VStack(spacing: 16) {
 
            VStack(spacing: 8) {
                AppLogo()
                Text("Create Account")
                    .font(.title)
                    .bold()
            }
            .padding(.top, 16)


            ScrollView {
                VStack(spacing: 16) {
                    AppTextField(
                        text: $registerViewModel.firstName,
                        title: "First Name",
                        error: $registerViewModel.firstNameError
                    )

                    AppTextField(
                        text: $registerViewModel.lastName,
                        title: "Last Name",
                        error: $registerViewModel.lastNameError
                    )

                    AppTextField(
                        text: $registerViewModel.email,
                        title: "Email",
                        error: $registerViewModel.emailError
                    )

                    AppTextField(
                        text: $registerViewModel.password,
                        title: "Password",
                        error: $registerViewModel.passwordError
                    )

                    AppTextField(
                        text: $registerViewModel.confirmPassword,
                        title: "Confirm Password",
                        error: $registerViewModel.confirmPasswordError
                    )

                    PrimaryButton(title: "Register") {
                        registerViewModel.register()
                    }

                    Button("Already have an account? Login") {
                        authViewModel.onShowLogin()
                    }

                    Spacer(minLength: 40)
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            registerViewModel.authViewModel = authViewModel
        }
    }
}


struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
            .environmentObject(AuthViewModel())
    }
}
