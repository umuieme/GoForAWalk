//
//  ImageLoading.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-12.
//


//
//  ImageLoading.swift
//  AstroGlance
//
//  Created by Umesh Basnet on 2025-06-09.
//

import SwiftUI

struct ImageLoading : View {
    
    let size : CGFloat
    
    init(size: CGFloat = 100){
        self.size = size
    }
    
    var body : some View {
        Image("Logo")
            .resizable()
            .frame(width: size, height: size)
    }
}

#Preview {
    ImageLoading(size: 250)
}
