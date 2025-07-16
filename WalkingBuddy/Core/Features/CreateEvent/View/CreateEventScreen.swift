//
//  CreateEventScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import SwiftUI

struct CreateEventScreen: View {

    @StateObject private var createEventViewModel = CreateEventViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Create a New Walk")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Cover Photo
                ImagePicker(selectedImage: $createEventViewModel.image)

                // Event Title
                AppTextField(
                    text: $createEventViewModel.title,
                    title: "Event Title",
                    placeholder: "e.g., Morning Lakeside Walk"
                )

                // Date and Time
                VStack(alignment: .leading, spacing: 8) {
                    Text("Date and Time")
                        .font(.headline)
                    DatePicker(
                        "Start Time",
                        selection: $createEventViewModel.startDate,
                        in: Date()...,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    
                    .datePickerStyle(.compact)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }

                // Route Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("The Route")
                        .font(.headline)
                    LocationField(
                        title: "Meeting Point",
                        icon: "mappin.and.ellipse",
                        location: $createEventViewModel.startPoint
                    )
                    LocationField(
                        title: "End Point",
                        icon: "mappin.slash",
                        location: $createEventViewModel.destination)
                }

                // Event Details
                AppTextField(
                    text: $createEventViewModel.detail,
                    title: "Event Details",
                    placeholder: "Describe your walk...",
                    lineLimit: 4
                )

                PaceSelector(selectedPace: $createEventViewModel.pace)

                PrimaryButton(title: "Create Event") {
                    dismiss()
                }
                .padding(.top)
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.1), Color.white],
                startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    NavigationStack {
        CreateEventScreen()
    }

}
