//
//  ImagePickerCoordinator.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import SwiftUI

/// A view that wraps UIImagePickerController, allowing it to be used in SwiftUI.
struct ImagePickerCoordinator: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType
    @Binding var isPresented: Bool

    /// This function is called by SwiftUI to create the UIKit controller.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator // The coordinator handles events from the picker.
        return picker
    }
    
    /// This function is used to update the controller, but we don't need it here.
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    /// Creates the coordinator instance that acts as the delegate.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Coordinator Class
    /// The Coordinator class handles communication from the UIImagePickerController.
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerCoordinator
        
        init(_ parent: ImagePickerCoordinator) {
            self.parent = parent
        }
        
        /// This delegate method is called when the user finishes picking an image.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            // Dismiss the picker view.
            parent.isPresented = false
        }
        
        /// This delegate method is called when the user cancels.
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Dismiss the picker view.
//            picker.dismiss(animated: true)
            parent.isPresented = false

        }
    }
}
