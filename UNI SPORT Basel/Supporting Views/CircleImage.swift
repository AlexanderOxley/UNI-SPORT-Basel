/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that clips an image to a circle and adds a stroke and shadow.
 */

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .clipShape(Circle())
        .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("kickboxing"))
    }
}
#endif
