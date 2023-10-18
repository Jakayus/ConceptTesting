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
            .containerBackground(for: .widget) {
                Color.green
            }
            
        }
        
    }
    
}

// 3. timeline provider
struct ViewSizeTimelineProvider: TimelineProvider {
    
    typealias Entry = ViewSizeEntry
    
    func placeholder(in context: Context) -> Entry {
        // provides dummy data to UI as placeholder as Widget gets ready
        return ViewSizeEntry(date: Date(), providerInfo: "Placeholder")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        // provides the data required by the system to render the widget in the gallery
        let entry = ViewSizeEntry(date: Date(), providerInfo: "snapshot")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        // provides an array of timeline entries for the current time
        // optionally provides future times to update a widget
        let entry = ViewSizeEntry(date: Date(), providerInfo: "timeline")
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
    
}

// 4. widget configuration
@main
struct ViewSizeWidget: Widget {
    let kind: String = "ViewSizeWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ViewSizeTimelineProvider()) { entry in
            ViewSizeWidgetView(entry: entry)
        }
        .configurationDisplayName("View Size Widget")
        .description("This is a demo widget")
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge
        ])
    }
    
    
}
