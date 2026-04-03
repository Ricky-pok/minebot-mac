import Foundation

enum ActionKind: String, CaseIterable, Identifiable {
    case keyPress = "Key Press"
    case mouseClick = "Mouse Click"
    case delay = "Delay"

    var id: String { rawValue }
}

struct RecordedAction: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let detail: String
}
