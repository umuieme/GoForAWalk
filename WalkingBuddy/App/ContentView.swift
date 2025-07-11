//
//  ContentView.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()
    var body: some View {
        
        Group {
            switch authViewModel.authState {
            case .uninitialized:
                SplashScreen()
            case .login:
                HomeScreen()
            case .register:
                RegisterScreen()
            case .profileSetup:
                ProfileSetupScreen()
            case .dashboard:
                HomeScreen()
            }
        
        }
        .environmentObject(authViewModel)
        
    }
}

#Preview {
    ContentView()
}
