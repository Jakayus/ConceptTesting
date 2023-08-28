//
//  ViewSizeWidget.swift
//  ViewSizeWidget
//
//  Created by Joel Sereno on 8/27/23.
//

import WidgetKit
import SwiftUI

/*
 widgets consist of 4 components:
 1. timeline entry
 2. widget view
 3. timeline provider
 4. widget configuration
 
 
 */


// 1. timeline entry
struct ViewSizeEntry: TimelineEntry {
    let date: Date
    let providerInfo: String // info related to timeline provider to show on widget
}


// 2. widget view

struct ViewSizeWidgetView: View {
    
    let entry: ViewSizeEntry
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                // show view size
                Text("\(Int(geometry.size.width)) x \(Int(geometry.size.height))")
                    .font(.system(.title2, weight: .bold))
                
                // show provider info
                Text(entry.providerInfo)
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            
        }
        
    }
    
}
