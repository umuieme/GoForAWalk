//
//  AppTextField.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import SwiftUI

struct AppTextField: View {
    @Binding var text: String

    var title: String? = nil
    var placeholder: String? = nil
    var lineLimit: Int? = nil
    var isPassword: Bool = false
    var error: Binding<String>? = nil

    @State private var isFocused = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if title != nil {
                Text(title!)
                    .font(.headline)
            }
            HStack {
                if isPassword {
                    SecureField(placeholder ?? "", text: $text)
                        .padding(.vertical, 12)
                        .font(.body)
                } else if lineLimit != nil {
                    TextEditor(text: $text)

                        .padding(.vertical, 4)
                        .frame(height: CGFloat(lineLimit! * 22))
                        .scrollContentBackground(.hidden)
                } else {
                    TextField(placeholder ?? "", text: $text)
                        .padding(.vertical, 12)
                        .font(.body)
                        
                }
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isFocused ? .blue : .clear, lineWidth: 2)
            )

            if error != nil && !error!.wrappedValue.isEmpty {
                Text(error!.wrappedValue)
                    .foregroundColor(.red)
                    .font(.caption)
            }

        }
    }
}

#Preview {
    VStack {
        AppTextField(
            text: .constant(""),
            title: "Title",
            error: .constant("Error")
        )
        AppTextField(
            text: .constant(""),
            title: "Title",
            lineLimit: 4,
            error: .constant("Error")
        )
        AppTextField(
            text: .constant("asd"),
            title: "Event Details",
            placeholder: "Describe your walk...",
            lineLimit: 4
        )
        AppTextField(text: .constant("asd"), isPassword: true)
    }
}
