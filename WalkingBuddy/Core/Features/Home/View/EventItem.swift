//
//  EventItem.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-20.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            
            AppNetworkImageView(
                imageUrl: event.getImagePreviewUrl(),
                size: CGSize(width: 150, height: 120)
            )
            .padding(.trailing, 4)

            VStack(alignment: .leading, spacing: 4) {
                Text(event.startDate.formatted(.dateTime.day().month().year()))
                    .font(.subheadline)
                    
                Text(event.title)
                    .font(.headline)
                Text(event.getUserName())
                    .font(.subheadline)
                    
                Text(event.detail ?? "No details available")
                    .lineLimit(3)
                
            }
        }
        
    }
}

#Preview {
    EventItem(event: Dummy.eventList().first!)
    
}
    
