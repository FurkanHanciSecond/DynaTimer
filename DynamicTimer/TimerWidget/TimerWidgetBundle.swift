//
//  TimerWidgetBundle.swift
//  TimerWidget
//
//  Created by Furkan Hanci on 11/23/22.
//

import WidgetKit
import SwiftUI

@main
struct TimerWidgetBundle: WidgetBundle {
    var body: some Widget {
        TimerWidget()
        TimerWidgetLiveActivity()
    }
}
