//
//  PrimaryButton.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var isLoading: Bool = false
    let action: () -> Void
    var body: some View {
        Button{
            if !(isLoading) {
                action()
            }
        } label: {
            if isLoading {
                ProgressView()
            } else {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 24)
            }

        }
        .buttonStyle(.borderedProminent)
        .tint(.green)

    }
}

#Preview {
    PrimaryButton(title: "Save", isLoading: false) {

    }
}
