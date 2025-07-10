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
    let isPassword: Bool = true
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if title != nil {
                Text(title!)
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.7))
                    .padding(0)
            }
            if(isPassword){
                SecureField(text: text) {
                    Text(title ?? "")
                        .font(.title2)
                }
                .padding(0)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .font(.title3)
            } else {
                TextField(text: text) {
                    Text(title ?? "")
                        .font(.title2)
                }
                .padding(0)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .font(.title3)
            }
            if (error != nil && !error!.wrappedValue.isEmpty) {
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
