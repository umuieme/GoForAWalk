//
//  PrimaryButton.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)

        }
        .buttonStyle(.borderedProminent)
        .tint(.green)

    }
}

#Preview {
    PrimaryButton(title: "Save") {

    }
}
