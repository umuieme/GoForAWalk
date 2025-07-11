//
//  CreateEventScreen.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import SwiftUI

struct CreateEventScreen: View {
    
    @StateObject private var createEventViewModel = CreateEventViewModel()

    var body: some View {
        Form{
            
            Section("Cover Photo") {
                ImagePicker(selectedImage: $createEventViewModel.image)
                    .frame(maxWidth: .infinity)
                    
            }
            AppTextField(text: $createEventViewModel.title, title: "Event Title")
            
            Section("Date and Time") {
                DatePicker(
                    "Start",
                    selection: $createEventViewModel.startDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
               

            }
            Section("The Route") {
                HStack {
                    Text("Meeting point")
                    Spacer()
                    Image(systemName: "mappin")
                }
                .buttonBorderShape(.roundedRectangle)
                
                HStack {
                    Text("End point")
                    Spacer()
                    Image(systemName: "mappin")
                }
                .buttonBorderShape(.roundedRectangle)
                
            }
            
            Section("Event Details") {
                TextField("",text: $createEventViewModel.detail, axis: .vertical)
                
                    .lineLimit(3...5)
            }
            
            Section ("Pace") {
                Button {
                    createEventViewModel.isPacePickerShowing = true
                } label: {
                    Text("Select your walking pace")
                }
                .sheet(isPresented: $createEventViewModel.isPacePickerShowing) {
                    NavigationStack{
                        VStack{
                            Picker(selection: $createEventViewModel.pace) {
                                ForEach(WalkingPace.allCases) { walkingPace in
                                    Text(walkingPace.rawValue).tag(walkingPace)
                                    
                                }
                            } label: {
                                Text("Your walking pace")
                            }
                            .pickerStyle(.inline)
                            .presentationDetents([.fraction(0.25)])
                        }
                    }


                }

            }
            
            PrimaryButton(title: "Create an event") {
                
            }
            
            
        }
        .navigationTitle("Create an Event")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationStack {
        CreateEventScreen()
    }
        
}
