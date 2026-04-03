import Foundation

struct MacroProfile: Codable {
    let name: String
    let actions: [MacroAction]
}
