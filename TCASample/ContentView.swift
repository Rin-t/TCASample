//
//  ContentView.swift
//  TCASample
//
//  Created by Rin on 2023/08/24.
//

import SwiftUI
import ComposableArchitecture

struct Counter: Reducer {

    struct State: Equatable {
        var count = 0
    }

    enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.count += 1
            return .none
        }
    }
}

struct ContentView: View {

    let store: StoreOf<Counter>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Button{
                    viewStore.send(.decrementButtonTapped)
                } label: {
                    Image(systemName: "minus")
                }
                Text("\(viewStore.count)")
                  .monospacedDigit()

                Button {
                  viewStore.send(.incrementButtonTapped)
                } label: {
                  Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: Counter.State(), reducer: {
        Counter()._printChanges()
    }))
}
