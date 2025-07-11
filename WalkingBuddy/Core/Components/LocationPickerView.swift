//
//  LocationPickerView.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import MapKit
import SwiftUI

struct LocationPickerView: View {
    
    @Binding var selectedLocation: LocationData?
    
    @StateObject private var locationManager = LocationPickerViewModel()
    @State private var position: MapCameraPosition = .automatic
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            AppTextField(text: $locationManager.searchQuery, placeholder: "Search location" )
                .padding()


            if !locationManager.searchResults.isEmpty {
                List(locationManager.searchResults) { location in
                    Text(location.name)
                        .font(.headline)

                        .onTapGesture {
                            // When a result is tapped, select it and hide the list
                            locationManager.selectedLocation = location
                            position =
                                .camera(
                                    MapCamera(
                                        centerCoordinate:
                                            CLLocationCoordinate2D(
                                                latitude: location.latitude,
                                                longitude: location.longitude
                                            ),
                                        distance: 100
                                    )
                                )

                        }
                }
                .listStyle(.plain)
            }
            MapReader { reader in
                Map(position: $position) {
                    if let location = locationManager.selectedLocation {
                        Marker(
                            location.name,
                            coordinate: location.toCLLocationCoordinate2D()
                        )
                    }

                }
            }
            if let location = locationManager.selectedLocation {
                                VStack {
                                    Text("Selected: \(location.name)")
                                        .font(.headline)
                                    PrimaryButton(title: "Confirm Selection") {
                                        self.selectedLocation = location
                                        dismiss()
                                    }
                                }
                                .padding()
                                .background(.thinMaterial)
                            }

        }
        .onAppear() {
            if let location = selectedLocation {
                locationManager.selectedLocation = location
                position =
                    .camera(
                        MapCamera(
                            centerCoordinate: location
                                .toCLLocationCoordinate2D(),
                            distance: 50
                        )
                    )
            }
            
        }
    }
}

#Preview {
    LocationPickerView(selectedLocation: .constant(nil))
}
