//
//  HomeTab.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-20.
//

import SwiftUI

struct HomeTab: View {

    @StateObject var homeViewModel = HomeEventViewModel()
    @State private var selectedEvent: Event?
    var body: some View {
        Group {
            if homeViewModel.isLoading {
                ProgressView("Loading events...")
                    .padding()
            } else if homeViewModel.events.isEmpty {
                Text("No events found.")
                    .padding()
            } else {
                List(homeViewModel.events) { event in
                    
                        EventItem(event: event)
                        .onTapGesture {
                            selectedEvent = event
                        }
                    

                }
            }

        }
        .navigationDestination(item: $selectedEvent) { event in
            WalkDetailScreen(event: event)
        }
    }
}

#Preview {
    HomeTab()
}
