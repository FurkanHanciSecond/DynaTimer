//
//  ContentView.swift
//  DynamicTimer
//
//  Created by Furkan Hanci on 11/23/22.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isStartTimer: Bool = false
    @State private var activity: Activity<TimeActivityAttributes>? = nil
    @State private var time: Date? = nil
    var body: some View {
        VStack {
            Text("Start The Time!")
                .font(.title)
                .foregroundColor(.black)

            Button {
                isStartTimer.toggle()

                if isStartTimer {
                    let attribute = TimeActivityAttributes()
                    let state = TimeActivityAttributes.ContentState(time: .now)

                    activity = try? Activity<TimeActivityAttributes>.request(attributes: attribute, contentState: state)
                } else {
                    guard let time else { return }
                    let state = TimeActivityAttributes.ContentState(time: time)
                    Task {
                        await activity?.end(using: state ,dismissalPolicy: .immediate)
                    }
                    self.time = nil
                }
            } label: {
                Image(systemName: isStartTimer ? "pause.fill" : "play.fill")
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.black)
                    .background(isStartTimer ? .red : .green)
                    .animation(.easeOut, value: 0.5)
                    .clipShape(Circle())
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
