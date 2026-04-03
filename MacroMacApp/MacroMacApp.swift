import SwiftUI

@main
struct MacroMacApp: App {
    @StateObject private var viewModel = MacroEditorViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .frame(minWidth: 980, minHeight: 620)
        }
    }
}
