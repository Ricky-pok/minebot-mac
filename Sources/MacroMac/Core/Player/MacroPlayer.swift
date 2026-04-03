import Foundation

struct MacroPlayer {
    var statusDescription: String {
        "idle"
    }

    func play(profile: MacroProfile) {
        // TODO: Implement playback engine
        print("Playing profile: \(profile.name) with \(profile.actions.count) actions")
    }

    func stop() {
        // TODO: Implement stop playback
    }
}
