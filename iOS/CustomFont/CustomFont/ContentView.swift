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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!").font(Font.custom("ArcadeClassic", size: 30))
        }
        .padding()
        .onAppear{
            for family in UIFont.familyNames {
                     print(family)
                     for names in UIFont.fontNames(forFamilyName: family){
                     print("== \(names)")
                     }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
