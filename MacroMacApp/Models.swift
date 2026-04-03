import Foundation

struct RecordedAction: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let detail: String
}
