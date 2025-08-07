//
//  WalkDetailScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-14.
//

import SwiftUI

struct WalkDetailScreen: View {
    let walk: Event
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .leading, spacing: 8) {
                AppNetworkImageView(
                    imageUrl: walk.imageId,
                    size: CGSize(width: reader.size.width, height: 300)
                )
                VStack (alignment: .leading){
                    Text(walk.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(walk.startDate.description)
                        .foregroundColor(.secondary)
                        .font(.caption)
                    Text(walk.detail ?? "")
                        .padding(.top, 8)
                    Divider()
                    Text("Starting at: \(walk.startingPoint.name)")
                    Text("Ending at: \(walk.endPoint.name)")

                }
                .padding()
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
        
    }
}

#Preview {
    WalkDetailScreen(walk: Dummy.eventList()[0])
}
