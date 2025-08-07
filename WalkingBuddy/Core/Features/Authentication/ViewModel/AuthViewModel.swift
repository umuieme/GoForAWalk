//
//  AuthViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import Foundation

enum AuthState {
    case uninitialized
    case login
    case register
    case profileSetup
    case dashboard
}

@MainActor
class AuthViewModel: ObservableObject {

    @Published var authState: AuthState = .uninitialized

    func onLoginSuccess() {
        authState = .dashboard
    }

    func onShowRegsitraiton() {
        authState = .register
    }
    
    func onShowLogin(){
        authState = .login
    }

    func onRegisterSuccess() {
        authState = .dashboard
    }
    
    func checkAuthStatus() {
           Task {
               do {
                   _ = try await ApiService.shared.getCurrentSession()
                   authState = .dashboard
               } catch {
                   authState = .login
               }
           }
       }

}
