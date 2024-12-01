import SwiftUI

enum ViewState {
    case willAppear
    case didAppear
    case willDisappear
    case didDisappear
}

func getRotation(for state: ViewState) -> Angle {
    switch state {
    case .willAppear:
        return .degrees(30)
    case .didAppear:
        return .degrees(0)
    case .willDisappear:
        return .degrees(-30)
    case .didDisappear:
        return .degrees(-60)
    }
}

struct ContentView: View {
    @State private var currentState: ViewState = .willAppear

    var body: some View {
        Text("Hello, World!")
            .rotationEffect(getRotation(for: currentState))
            .onAppear {
                currentState = .didAppear
            }
            .onDisappear {
                currentState = .didDisappear
            }
    }
}
