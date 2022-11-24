//
//  TimerActivityAttributes.swift
//  DynamicTimer
//
//  Created by Furkan Hanci on 11/23/22.
//

import Foundation
import ActivityKit

struct TimeActivityAttributes: ActivityAttributes {
    public typealias TimeActivityStatus = ContentState

    public struct ContentState: Codable , Hashable {
        var time: Date
    }
}
