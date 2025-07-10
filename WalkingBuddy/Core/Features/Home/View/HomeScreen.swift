//
//  HomeScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeTab()
                }

                Tab("My Walks", systemImage: "figure.walk") {
                    Text("My Events")
                }


                Tab("Create Walks", systemImage: "plus.app.fill") {
                    Text("Create")
                }
                
                Tab("Message", systemImage: "message.fill") {
                    Text("Message")
                }
                
                Tab("Profile", systemImage: "person.fill") {
                    Text("Create")
                }
                
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
