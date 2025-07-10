//
//  EventItem.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-20.
//

import SwiftUI

struct EventItem: View {
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/1009355/pexels-photo-1009355.jpeg")) { image in
                image.resizable()
                    .frame(width: 150, height: 120)
            } placeholder: {
                ProgressView()
            }

            
            VStack(alignment: .leading, spacing: 4) {
                Text("July 1, 10:00 PM")
                    .font(.subheadline)
                    
                Text("Morning Stroll in Central Park")
                    .font(.headline)
                Text("Join us for a refreshing walk through Central Park. Meet new people and enjoy the scenery. Join us for a refreshing walk through Central Park. Meet new people and enjoy the scenery. Join us for a refreshing walk through Central Park. Meet new people and enjoy the scenery.")
                    .lineLimit(3)
                
            }
        }
    }
}

#Preview {
    EventItem()
}
