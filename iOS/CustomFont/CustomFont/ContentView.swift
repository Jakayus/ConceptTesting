//
//  ContentView.swift
//  CustomFont
//
//  Created by Joel Sereno on 8/2/23.
//

/*
 custom font printout
 Arcade Classic
 == ArcadeClassic
 
 
 */


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!").font(Font.custom("ArcadeClassic",
                                                   size: textSize(textStyle: .title2)))
        }

//        .onAppear{
//            for family in UIFont.familyNames {
//                     print(family)
//                     for names in UIFont.fontNames(forFamilyName: family){
//                     print("== \(names)")
//                     }
//                }
//        }
    }
    
    // methods
    func textSize(textStyle: UIFont.TextStyle) -> CGFloat {
        return UIFont.preferredFont(forTextStyle: textStyle).pointSize
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
