import Foundation

final class MacroEditorViewModel: ObservableObject {
    @Published var actions: [RecordedAction] = [
        RecordedAction(title: "Delay", detail: "500 ms"),
        RecordedAction(title: "Key Press", detail: "Space"),
        RecordedAction(title: "Mouse Click", detail: "X: 640  Y: 360")
    ]

    @Published var selectedKind: ActionKind = .keyPress
    @Published var keyInput: String = "A"
    @Published var clickX: String = "400"
    @Published var clickY: String = "300"
    @Published var delayMs: String = "500"
    @Published var statusText: String = "Idle"

    func record() {
        statusText = "Recording"
        actions.append(RecordedAction(title: "Recording", detail: "Started recording session"))
    }

    func play() {
        statusText = "Playing"
        actions.append(RecordedAction(title: "Playback", detail: "Started macro playback"))
    }

    func stop() {
        statusText = "Stopped"
        actions.append(RecordedAction(title: "Stop", detail: "Execution stopped"))
    }

    func addConfiguredAction() {
        switch selectedKind {
        case .keyPress:
            let value = keyInput.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !value.isEmpty else { return }
            actions.append(RecordedAction(title: "Key Press", detail: value))
        case .mouseClick:
            let x = clickX.trimmingCharacters(in: .whitespacesAndNewlines)
            let y = clickY.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !x.isEmpty, !y.isEmpty else { return }
            actions.append(RecordedAction(title: "Mouse Click", detail: "X: \(x)  Y: \(y)"))
        case .delay:
            let value = delayMs.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !value.isEmpty else { return }
            actions.append(RecordedAction(title: "Delay", detail: "\(value) ms"))
        }
    }

    func removeActions(at offsets: IndexSet) {
        actions.remove(atOffsets: offsets)
    }
}
