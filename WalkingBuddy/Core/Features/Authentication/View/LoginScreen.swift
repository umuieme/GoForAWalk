//
//  LoginScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct LoginScreen: View {

    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 16) {
            AppLogo()
            Spacer()
            Text("Login")
                .font(.title)
                .bold()
                .padding(.bottom, 32)
            AppTextField(
                text: $loginViewModel.email,
                title: "Email",
                error: $loginViewModel
                    .emailError)
            VStack {
                AppTextField(
                    text: $loginViewModel.password,
                    title: "Password",
                    error: $loginViewModel.passwordError
                )
                Text("Forget Password?")
                    .foregroundStyle(.blue)
            }

            PrimaryButton(title: "Login") {
                loginViewModel.loginWithEmailPassword()
            }
            Button("Create new account") {
                authViewModel.onShowRegsitraiton()
            }

            Spacer()
        }
        .padding()
        .onAppear {
            loginViewModel.authViewModel = authViewModel
        }
    }
}

#Preview {
    LoginScreen()
        .environmentObject(AuthViewModel())
}
