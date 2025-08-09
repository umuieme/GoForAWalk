//
//  WalkDetailScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-14.
//

import SwiftUI

struct WalkDetailScreen: View {
    
    @StateObject var viewModel = WalkDetailViewModel()
    
    let event: Event
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .leading, spacing: 8) {
                AppNetworkImageView(
                    imageUrl: event.getImagePreviewUrl(),
                    size: CGSize(width: reader.size.width, height: 300)
                )
                VStack(alignment: .leading) {

                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 16)

                    // Description
                    if let detail = event.detail {
                        Text(detail)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.top, 4)
                    }

                    // Details section
                    SectionHeader("Details")

                    VStack(spacing: 0) {
                        DetailRow(
                            label: "Date",
                            value: event.startDate.formatted(
                                date: .long, time: .omitted))
                        DetailRow(
                            label: "Time",
                            value: event.startDate.formatted(
                                date: .omitted, time: .shortened))
                        DetailRow(
                            label: "Starting At",
                            value: event.startingPoint.name)
                        DetailRow(
                            label: "Ending At",
                            value: event.endPoint.name
                        )
                    }
                    .padding(.horizontal)

                    // Attendees
                    //                                   SectionHeader("Attendees")

                    // Join button
                    //                    PrimaryButton(action: { /* join event */ }) {
                    //                                       Text("Join")
                    //                                           .font(.headline)
                    //                                           .foregroundColor(.primary)
                    //                                           .frame(maxWidth: .infinity)
                    //                                           .frame(height: 48)
                    //                                           .background(Color.blue.opacity(0.2))
                    //                                           .cornerRadius(24)
                    //                                   }
                    //                                   .padding(.horizontal)
                    //                                   .padding(.bottom, 16)

                    if viewModel.joinRequest == nil {
                        PrimaryButton(
                            title: "Request to Join",
                            isLoading: viewModel
                                .isRequesting) {
                                    Task {
                                        await viewModel.requestToJoin(event: event)
                                    }
                                }
                                .padding(.top, 16)
                    } else if viewModel.joinRequest!.status == .pending {
                    
                        Text("Request Pending")
                        .font(.title2)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .frame(alignment: Alignment.center)
                            .padding(.top, 16)
                    }

                }
                .padding()
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear(){
            Task {
//                await viewModel.getJoinRequestStatus(event: event)
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            
            
        }

    }
}

struct SectionHeader: View {
    let title: String
    init(_ title: String) { self.title = title }
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 4)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    var body: some View {
        VStack(spacing: 4) {
            Divider()
            HStack {
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding(.vertical, 12)
        }
        
    }
}

#Preview {
    WalkDetailScreen(event: Dummy.eventList()[0])
}
