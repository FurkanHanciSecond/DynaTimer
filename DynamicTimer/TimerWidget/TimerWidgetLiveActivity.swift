//
//  TimerWidgetLiveActivity.swift
//  TimerWidget
//
//  Created by Furkan Hanci on 11/23/22.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TimerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimeActivityAttributes.self) { context in

            VStack {
                Text("This Is Lock Scren Widget Text")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {

                DynamicIslandExpandedRegion(.leading) {
                    CountView(context: context)
                }

                DynamicIslandExpandedRegion(.trailing) {
                    HourView(context: context)
                }

                DynamicIslandExpandedRegion(.bottom) {
                   DateView(context: context)
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct CountView: View {
    let context : ActivityViewContext<TimeActivityAttributes>

    var body: some View {
        Text(context.state.time , style: .relative)
            .foregroundColor(.green)
    }
}

struct DateView: View {
    let context: ActivityViewContext<TimeActivityAttributes>

    var body: some View {
        Text(context.state.time , style: .date)
            .foregroundColor(.yellow)
    }
}

struct HourView: View {
    let context: ActivityViewContext<TimeActivityAttributes>

    var body: some View {
        Text(context.state.time , style: .time)
            .foregroundColor(.indigo)
    }
}

