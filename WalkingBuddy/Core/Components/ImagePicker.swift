//
//  ImagePicker.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Photos
import SwiftUI

struct ImagePicker: View {
    /// A binding to the image that the parent view will receive.
    @Binding var selectedImage: UIImage?

    /// State to control the presentation of the image source selection dialog.
    @State private var showSourceDialog: Bool = false

    /// State to control the presentation of the actual image picker (camera or library).
    @State private var showPicker: Bool = false

    /// State to determine which source to use: camera or photo library.
    @State private var sourceType: UIImagePickerController.SourceType = .camera

    var body: some View {
        // MARK: - Image Display
        // Displays the selected image or a placeholder if no image is selected.
        Group {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                // Placeholder view
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
        .onTapGesture {
            self.showSourceDialog = true
        }
        // MARK: - Source Selection Dialog
        .confirmationDialog(
            "Choose Image Source", isPresented: $showSourceDialog,
            titleVisibility: .visible
        ) {
            // Camera Button
            Button("Camera") {
                checkCameraPermission()
            }

            // Photo Library Button
            Button("Photo Library") {
                self.sourceType = .photoLibrary
                self.showPicker = true
            }
        }
        // MARK: - Image Picker Presentation
        .fullScreenCover(isPresented: $showPicker) {
            // Presents the custom ImagePickerCoordinator view.
            ImagePickerCoordinator(
                selectedImage: $selectedImage, sourceType: self.sourceType, isPresented: $showPicker)
        }
    }

    /// Checks for camera permissions and sets the source type.
    /// If permission is granted, it shows the picker.
    /// If denied, it (ideally) should guide the user to settings.
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // Permission already granted.
            self.sourceType = .camera
            self.showPicker = true
        case .notDetermined:
            // Request permission. The system will show a prompt.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.sourceType = .camera
                        self.showPicker = true
                    }
                }
            }
        case .denied, .restricted:
            // Permission was denied or restricted.
            // For a real app, you should show an alert guiding the user to the Settings app.
            print("Camera access denied.")
            break
        @unknown default:
            break
        }
    }
}

#Preview {
    ImagePicker(selectedImage: .constant(nil))
}
