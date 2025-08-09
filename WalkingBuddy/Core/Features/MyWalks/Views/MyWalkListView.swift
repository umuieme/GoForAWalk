//
//  MyWalkListView.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-14.
//

import SwiftUI

struct MyWalkListView: View {

    let walkType: MyWalkType
    let walkList: [Event]
    @State private var selectedEvent: Event?
    @State private var showEventDetail: Bool = false

    var body: some View {

        VStack {
            List {
                ForEach(walkList) { walk in
                    Button {
                        selectedEvent = walk
                        showEventDetail = true
                    } label: {
                        MyWalkItemView(walk: walk)

                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.white)

                }

            }
            .listStyle(.plain)
            .background()

        }
        .navigationDestination(item: $selectedEvent) { walk in
            WalkDetailScreen(event: walk)
        }
    }
}

#Preview {
    MyWalkListView(walkType: MyWalkType.upcoming, walkList: Dummy.eventList())
}
