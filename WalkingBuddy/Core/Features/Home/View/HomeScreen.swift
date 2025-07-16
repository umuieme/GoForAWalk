//
//  HomeScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct HomeScreen: View {
    @State var selectedTab: Tab = .home
    @State var isCreatingWalk: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    switch selectedTab {
                    case .home:
                        HomeTab()
                    case .myWalks:
                        MyWalkTab()
                    case .createWalk:
                        Text("")
                    case .message:
                        Text("Message")
                    case .profile:
                        Text("Profile")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        
                        
                        TabButton(tab: tab, isSelected: selectedTab == tab ) {
                            if(tab == .createWalk) {
                                isCreatingWalk = true
                            } else {
                                selectedTab = tab

                            }
                        }
                        .selectionDisabled()
                    }
                    
                    
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal)
            }
            .navigationDestination(isPresented: $isCreatingWalk) {
                CreateEventScreen()
            }
        }
    }
}

struct TabButton: View {
    let tab: Tab
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(
                systemName: tab.icon
            )
            .font(.system(size: 24))
            .foregroundColor(isSelected ? .blue : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HomeScreen()
}
