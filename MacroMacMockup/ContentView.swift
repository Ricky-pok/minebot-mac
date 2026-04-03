import SwiftUI

struct MacroRow: Identifiable {
    let id = UUID()
    let icon: String
    let command: String
    let action: String
    let value1: String
    let value2: String
    let color: Color
}

struct ContentView: View {
    private let rows: [MacroRow] = [
        .init(icon: "keyboard", command: "KEYBOARD", action: "KeyDown", value1: "\"ShiftLeft\"", value2: "", color: .blue),
        .init(icon: "cursorarrow.motionlines", command: "MOUSE", action: "Move", value1: "X = 215", value2: "Y = 24", color: .green),
        .init(icon: "keyboard", command: "KEYBOARD", action: "KeyUp", value1: "\"Capital\"", value2: "", color: .blue),
        .init(icon: "cursorarrow.motionlines", command: "MOUSE", action: "Move", value1: "X = 532", value2: "Y = 244", color: .green),
        .init(icon: "cursorarrow.click", command: "MOUSE", action: "Click", value1: "X = 599", value2: "Y = 352", color: .green),
        .init(icon: "doc", command: "OPEN FILE", action: "notepad", value1: "", value2: "", color: .red),
        .init(icon: "textformat", command: "TYPE TEXT", action: "This is the droid you're looking for!", value1: "", value2: "", color: .red),
        .init(icon: "hourglass", command: "DELAY", action: "10", value1: "", value2: "", color: .orange),
        .init(icon: "globe", command: "OPEN URL", action: "http://jitbit.com", value1: "", value2: "", color: .red),
        .init(icon: "xmark.rectangle", command: "CLOSE WINDOW", action: "*notepad*", value1: "", value2: "", color: .red),
        .init(icon: "photo", command: "FIND IMAGE", action: "", value1: "", value2: "", color: .red),
        .init(icon: "cursorarrow.motionlines", command: "MOUSE", action: "Move", value1: "X = 215", value2: "Y = 24", color: .green)
    ]

    var body: some View {
        VStack(spacing: 0) {
            topMenuBar
            toolbar
            Divider()
            HStack(spacing: 0) {
                sideToolbar
                Divider()
                commandTable
            }
        }
        .background(Color(nsColor: .windowBackgroundColor))
    }

    private var topMenuBar: some View {
        HStack(spacing: 28) {
            ForEach(["File", "Edit", "View", "Insert", "Actions", "Tools", "Help"], id: \.self) { item in
                Text(item)
                    .font(.system(size: 16, weight: .regular))
            }
            Spacer()
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 10)
        .background(.white)
    }

    private var toolbar: some View {
        HStack(spacing: 0) {
            toolbarButton(title: "RECORD", systemImage: "record.circle.fill", color: .orange)
            toolbarButton(title: "PLAY", systemImage: "play.circle.fill", color: .orange)

            Divider().frame(height: 48).padding(.horizontal, 16)

            menuLikeButton("Record special")
            menuLikeButton("Play special")

            Divider().frame(height: 48).padding(.horizontal, 16)

            HStack(spacing: 10) {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(.gray)
                Text("Settings")
                    .font(.system(size: 18))
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color.white)
    }

    private func toolbarButton(title: String, systemImage: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: systemImage)
                .font(.system(size: 34))
                .foregroundStyle(color)
            Text(title)
                .font(.system(size: 18, weight: .bold))
        }
        .padding(.trailing, 26)
    }

    private func menuLikeButton(_ title: String) -> some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.system(size: 18))
            Image(systemName: "chevron.down")
                .font(.system(size: 11, weight: .semibold))
        }
        .padding(.trailing, 20)
    }

    private var sideToolbar: some View {
        VStack(spacing: 0) {
            ForEach(sideIcons, id: \.self) { icon in
                Button(action: {}) {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .frame(width: 54, height: 44)
                }
                .buttonStyle(.plain)
                Divider()
            }
            Spacer()
        }
        .frame(width: 58)
        .background(Color(nsColor: NSColor(calibratedWhite: 0.97, alpha: 1)))
    }

    private var commandTable: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                headerCell("Command", width: 290)
                headerCell("", width: 320)
                headerCell("", width: 300)
                headerCell("", width: 300)
            }
            Divider()

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(Array(rows.enumerated()), id: \.element.id) { index, row in
                        HStack(spacing: 0) {
                            tableCell(rowView(row.icon, row.command, row.color), width: 290, highlighted: index == rows.count - 1)
                            tableCell(Text(row.action).foregroundStyle(row.color), width: 320, highlighted: index == rows.count - 1)
                            tableCell(Text(row.value1).foregroundStyle(row.color), width: 300, highlighted: index == rows.count - 1)
                            tableCell(Text(row.value2).foregroundStyle(row.color), width: 300, highlighted: index == rows.count - 1)
                        }
                        Divider()
                    }
                }
            }
        }
    }

    private func rowView(_ icon: String, _ title: String, _ color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
            Text(title)
                .font(.system(size: 17, weight: .medium))
        }
        .foregroundStyle(color)
    }

    private func headerCell(_ title: String, width: CGFloat) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.primary)
            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(width: width, height: 38)
        .background(Color(nsColor: NSColor(calibratedWhite: 0.98, alpha: 1)))
    }

    private func tableCell<Content: View>(_ content: Content, width: CGFloat, highlighted: Bool) -> some View {
        HStack {
            content
            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(width: width, height: 42)
        .background(highlighted ? Color.accentColor.opacity(0.75) : Color.white)
    }

    private var sideIcons: [String] {
        [
            "clock.arrow.circlepath",
            "cursorarrow.click.2",
            "hourglass",
            "doc.on.doc",
            "textformat",
            "eyedropper",
            "photo",
            "record.circle",
            "globe",
            "xmark.square",
            "play.square",
            "info.circle",
            "questionmark.circle"
        ]
    }
}

#Preview {
    ContentView()
}
