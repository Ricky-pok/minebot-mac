import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MacroEditorViewModel

    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Macro Controls")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 8)

                Button(action: viewModel.record) {
                    Label("Record", systemImage: "record.circle")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.borderedProminent)

                Button(action: viewModel.play) {
                    Label("Play", systemImage: "play.circle")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.bordered)

                Menu {
                    Button("Add Keyboard Action", action: viewModel.addKeyAction)
                    Button("Add Mouse Click Action", action: viewModel.addClickAction)
                } label: {
                    Label("Add Action", systemImage: "plus.circle")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .menuStyle(.borderlessButton)
                .padding(.top, 8)

                Spacer()
            }
            .padding()
            .frame(minWidth: 240)
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                Text("Recorded Actions")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)

                List(viewModel.actions) { action in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(action.title)
                            .font(.headline)
                        Text(action.detail)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}
