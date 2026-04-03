import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MacroEditorViewModel

    var body: some View {
        NavigationSplitView {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Macro Controls")
                        .font(.title2)
                        .bold()

                    HStack {
                        Circle()
                            .fill(statusColor)
                            .frame(width: 10, height: 10)
                        Text("Status: \(viewModel.statusText)")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 4)

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

                    Button(action: viewModel.stop) {
                        Label("Stop", systemImage: "stop.circle")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)

                    Divider().padding(.vertical, 4)

                    Text("Add Action")
                        .font(.headline)

                    Picker("Action Type", selection: $viewModel.selectedKind) {
                        ForEach(ActionKind.allCases) { kind in
                            Text(kind.rawValue).tag(kind)
                        }
                    }
                    .pickerStyle(.menu)

                    actionEditor

                    Button(action: viewModel.addConfiguredAction) {
                        Label("Add Action to List", systemImage: "plus.circle")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer(minLength: 30)
                }
                .padding()
            }
            .frame(minWidth: 300)
        } detail: {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Recorded Actions")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("\(viewModel.actions.count) items")
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                .padding(.top)

                List {
                    ForEach(viewModel.actions) { action in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(action.title)
                                .font(.headline)
                            Text(action.detail)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: viewModel.removeActions)
                }
            }
        }
    }

    @ViewBuilder
    private var actionEditor: some View {
        switch viewModel.selectedKind {
        case .keyPress:
            VStack(alignment: .leading, spacing: 8) {
                Text("Keyboard Action")
                    .font(.subheadline).bold()
                TextField("Key", text: $viewModel.keyInput)
                    .textFieldStyle(.roundedBorder)
            }
        case .mouseClick:
            VStack(alignment: .leading, spacing: 8) {
                Text("Mouse Click Action")
                    .font(.subheadline).bold()
                TextField("X Position", text: $viewModel.clickX)
                    .textFieldStyle(.roundedBorder)
                TextField("Y Position", text: $viewModel.clickY)
                    .textFieldStyle(.roundedBorder)
            }
        case .delay:
            VStack(alignment: .leading, spacing: 8) {
                Text("Delay Action")
                    .font(.subheadline).bold()
                TextField("Milliseconds", text: $viewModel.delayMs)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }

    private var statusColor: Color {
        switch viewModel.statusText {
        case "Recording": return .red
        case "Playing": return .green
        case "Stopped": return .orange
        default: return .gray
        }
    }
}
