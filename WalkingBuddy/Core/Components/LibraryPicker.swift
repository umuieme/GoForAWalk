//
//  LibraryPicker.swift
//  Week5_DataExchange
//
//  Created by Umesh Basnet on 2025-06-13.
//

import SwiftUI
import PhotosUI

struct LibraryPicker : UIViewControllerRepresentable {
    @Binding var selectedImage : UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<LibraryPicker>) -> some UIViewController {
        // configure the view controller
        var libraryConfig = PHPickerConfiguration(
            photoLibrary: PHPhotoLibrary.shared()
        )
        libraryConfig.selectionLimit = 1
        libraryConfig.filter = .images
        
        // create a photo library pickker
        let imagePicker = PHPickerViewController(configuration: libraryConfig)
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {
        // update UI if required
    }
    
    func makeCoordinator() -> LibraryPicker.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator : NSObject, PHPickerViewControllerDelegate {
        
        var parent : LibraryPicker
        
        init(parent: LibraryPicker) {
            self.parent = parent
        }
        
        // callback after user selects the picture from the Photo Library
        func picker(
            _ picker: PHPickerViewController,
            didFinishPicking results: [PHPickerResult]
        ) {
            // closes the photolibrary
            picker.dismiss(animated: true)
            
            // check if user selected  any picture
            if results.count > 0 {
                
                print(#function, "user selected picture")
                
                if let selectedImage = results.first {
                    
                    // check if the selected image can be converted into UIImage type
                    if selectedImage.itemProvider
                        .canLoadObject(ofClass: UIImage.self) {
                        selectedImage.itemProvider
                            .loadObject(
                                ofClass: UIImage.self) { image, error in
                                    guard error == nil else {
                                        print(#function, "Cannot convert selected asset to UIImage")
                                        return
                                    }
                                    
                                    if let img = image {
                                        self.parent.selectedImage = img as? UIImage
                                    }
                                }
                        
                    }
                }
                
            } else {
                print( #function,"No Image selected")
                return;
            }
        }
        
    }
}
