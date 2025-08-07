//
//  PaceSelector.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import SwiftUI

struct PaceSelector: View {
    @Binding var selectedPace: WalkingPace?
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Select Your Pace")
                .font(.headline)
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(WalkingPace.allCases) { pace in
                    PaceButton(
                        pace: pace,
                        isSelected: pace == selectedPace
                    ) {
                        withAnimation {
                            selectedPace = pace
                        }
                    }
                }
            }
        }
    }
}

// MARK: - PaceButton (No Changes Needed)
struct PaceButton: View {
    let pace: WalkingPace
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: pace.icon)
                    .font(.title2)
                Text(pace.label)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .foregroundColor(isSelected ? .white : pace.color)
            .background(isSelected ? pace.color : Color(.systemGray6))
            .cornerRadius(12)
            .shadow(color: isSelected ? pace.color.opacity(0.4) : .clear, radius: 5, y: 3)
        }
    }
}


#Preview {
    struct PaceSelectorPreview: View {
            @State private var pace: WalkingPace? = .steadyWalk
            
            var body: some View {
                VStack {
                    PaceSelector(selectedPace: $pace)
                    
                }
                .padding()
            }
        }
        
        return PaceSelectorPreview()
}
