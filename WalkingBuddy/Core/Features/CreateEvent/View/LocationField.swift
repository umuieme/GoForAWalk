//
//  LocationField.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import SwiftUI

struct LocationField: View {
   
        let title: String
        let icon: String
        @State var showMapSheet: Bool = false
        @Binding var location: LocationData?
    
        var body: some View {
            HStack {
                
                            // Conditionally display the location name or the title
                            Text(location?.name ?? title)
                                .foregroundColor(location == nil ? .secondary : .primary)
                            
                Spacer()
                Image(systemName: icon)
                    .foregroundColor(.blue)
            }
            
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .onTapGesture {
                showMapSheet.toggle()
            }
            .sheet(isPresented: $showMapSheet) {
                LocationPickerView(selectedLocation: $location)
            }
        }
        
    
}

#Preview {
    LocationField(
        title: "Meeting Point",
        icon: "location.fill",
        location: .constant(nil)
    )
}
