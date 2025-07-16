//
//  MyWalkTab.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-12.
//

import SwiftUI

struct MyWalkTab: View {

    @State private var selectedType: MyWalkType = .upcoming

    var body: some View {
        VStack {
            Picker(selection: $selectedType) {
                ForEach(MyWalkType.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            } label: {
                Text("Walks")
            }
            .pickerStyle(.segmented)
            TabView(selection: $selectedType) {
                ForEach(MyWalkType.allCases, id: \.self) { item in
                    MyWalkListView(walkType: item, walkList: Dummy.eventList())
                }
            }

        }
    }
}

#Preview {
    MyWalkTab()
}
