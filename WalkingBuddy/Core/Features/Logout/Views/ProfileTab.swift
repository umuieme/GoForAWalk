//
//  ProfileTab.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-07.
//

import SwiftUI

struct ProfileTab: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Handle logout action
                        authViewModel.logout()
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    
                }
            }
    }
}

#Preview {
    ProfileTab()
}
