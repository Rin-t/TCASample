//
//  TCASampleApp.swift
//  TCASample
//
//  Created by Rin on 2023/08/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCASampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: Counter.State(), reducer: {
                Counter()._printChanges()
            }))
        }
    }
}
