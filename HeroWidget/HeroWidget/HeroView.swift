//
//  HeroView.swift
//  HeroWidget
//
//  Created by yunus olgun on 19.02.2021.
//

import SwiftUI

struct HeroView: View {
    let hero: Superhero
    var body: some View {
        HStack {
            CircularImageView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
            Spacer()
            VStack {
                Text(hero.name).font(.largeTitle).fontWeight(.bold).foregroundColor(.purple)
                Text(hero.realName).fontWeight(.semibold)
            }
            Spacer()
            
        }.padding().frame(width: UIScreen.main.bounds.width)
        
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: batman)
    }
}
