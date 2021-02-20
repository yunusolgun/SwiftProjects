//
//  CircularImageView.swift
//  HeroWidget
//
//  Created by yunus olgun on 19.02.2021.
//

import SwiftUI

struct CircularImageView: View {
    var image: Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.purple, lineWidth: 5))
            .shadow(radius: 15)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("batman"))
    }
}
