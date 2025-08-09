//
//  AppNetworkImageView.swift
//  AstroGlance
//
//  Created by Umesh Basnet on 2025-06-09.
//

import SwiftUI
import Kingfisher

struct AppNetworkImageView: View {
    
    let imageUrl : String?
    let size: CGSize?
    
    init(imageUrl: String? = nil, size: CGSize? = nil ) {
        self.imageUrl = imageUrl
        self.size = size
    }
    
    var body: some View {
        if let imageUrl = imageUrl {
            KFImage
                .url(URL(string: imageUrl))
                .setProcessor(
                    size != nil ?  DownsamplingImageProcessor(size: size!):DefaultImageProcessor.default
                       
                    
                )
                .resizable()
                
                .placeholder {
                    ImageLoading(size: size?.width ?? 200)
                }
                
                .cancelOnDisappear(true)
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: size?.width,
                    height: size?.height
                )  // full width & height
                .clipped()  // crop any overflow
        } else {
            ImageLoading(size: 200)
        }
    }
}

#Preview {
    AppNetworkImageView(imageUrl: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg")
}
