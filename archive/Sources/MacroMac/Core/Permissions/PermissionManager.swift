import Foundation
import ApplicationServices

struct PermissionManager {
    func isAccessibilityPermissionGranted() -> Bool {
        AXIsProcessTrusted()
    }
}
