//
//  HomeTab.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-20.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        List {
            EventItem()
            EventItem()
        }
    }
}

#Preview {
    HomeTab()
}
