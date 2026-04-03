import Foundation

final class MacroEditorViewModel: ObservableObject {
    @Published var actions: [RecordedAction] = [
        RecordedAction(title: "Delay", detail: "500 ms"),
        RecordedAction(title: "Key Press", detail: "Space"),
        RecordedAction(title: "Mouse Click", detail: "X: 640  Y: 360")
    ]

    func record() {
        actions.append(RecordedAction(title: "Recording", detail: "Started recording session"))
    }

    func play() {
        actions.append(RecordedAction(title: "Playback", detail: "Started macro playback"))
    }

    func addKeyAction() {
        actions.append(RecordedAction(title: "Key Press", detail: "Example: A"))
    }

    func addClickAction() {
        actions.append(RecordedAction(title: "Mouse Click", detail: "Example: X: 400  Y: 300"))
    }
}
