import Foundation

enum MacroAction: Codable {
    case keyPress(key: String)
    case mouseClick(x: Double, y: Double, button: String)
    case delay(milliseconds: Int)
}
