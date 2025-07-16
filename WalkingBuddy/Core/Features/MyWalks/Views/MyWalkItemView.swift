//
//  MyWalkItemView.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-12.
//

import SwiftUI

struct MyWalkItemView: View {
    let walk: Event
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(walk.startDate.ISO8601Format())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(walk.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(walk.getUserName())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            AppNetworkImageView(
                imageUrl: walk.image,
                size: CGSize(width: 150, height: 80)
            )

        }
        .padding(0)

    }
}

#Preview {
    MyWalkItemView(walk: Dummy.eventList()[0])
}
