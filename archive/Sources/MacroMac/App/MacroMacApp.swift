import Foundation

struct MacroMacApp {
    private let permissionManager = PermissionManager()
    private let recorder = MacroRecorder()
    private let player = MacroPlayer()

    func run() {
        print("MacroMac starter is ready.")
        print("Accessibility permission granted: \(permissionManager.isAccessibilityPermissionGranted())")
        print("Recorder status: \(recorder.statusDescription)")
        print("Player status: \(player.statusDescription)")
    }
}
