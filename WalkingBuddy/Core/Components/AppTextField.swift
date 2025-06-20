//
//  AppTextField.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct AppTextField: View {
    let text: Binding<String>
    let title: String?
    var error: Binding<String>? = nil
    var body: some View {
        VStack(alignment: .leading) {
            if title != nil {
                Text(title!)
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.7))
            }
            TextField(text: text) {
                Text(title ?? "")
                    .font(.title2)
            }
            
            .frame(maxWidth: .infinity, minHeight: 60)
            .textFieldStyle(.roundedBorder)
            .font(.title3)
            if error?.wrappedValue.isEmpty != nil {
                Text(error!.wrappedValue)
                    .foregroundStyle(.red)
                    .font(.caption)

            }
        }
    }
}

#Preview {
    AppTextField(
        text: .constant(""), title: "Title", error: .constant("Error")
    )
}
