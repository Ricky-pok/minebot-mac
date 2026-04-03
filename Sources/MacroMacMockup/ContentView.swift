import SwiftUI

struct MacroRow: Identifiable {
    let id = UUID()
    let icon: String
    let command: String
    let c2: String
    let c3: String
    let c4: String
    let color: Color
}

struct ContentView: View {
    @State private var selectedMenu: String = "File"
    @State private var selectedToolbar: String? = nil
    @State private var selectedSidebar: Int = 1
    @State private var selectedRow: UUID? = nil

    private let rows: [MacroRow] = [
        .init(icon: "keyboard", command: "KEYBOARD", c2: "KeyDown", c3: "\"ShiftLeft\"", c4: "", color: Color(red: 0.10, green: 0.35, blue: 0.95)),
        .init(icon: "cursorarrow.motionlines", command: "MOUSE", c2: "Move", c3: "X = 215", c4: "Y = 24", color: Color(red: 0.10, green: 0.62, blue: 0.18)),
        .init(icon: "keyboard", command: "KEYBOARD", c2: "KeyUp", c3: "\"Capital\"", c4: "", color: Color(red: 0.10, green: 0.35, blue: 0.95)),
        .init(icon: "cursorarrow.motionlines", command: "MOUSE", c2: "Move", c3: "X = 532", c4: "Y = 244", color: Color(red: 0.10, green: 0.62, blue: 0.18)),
        .init(icon: "cursorarrow.click", command: "MOUSE", c2: "Click", c3: "X = 599", c4: "Y = 352", color: Color(red: 0.10, green: 0.62, blue: 0.18)),
        .init(icon: "folder", command: "OPEN FILE", c2: "notepad", c3: "", c4: "", color: .red),
        .init(icon: "textformat", command: "TYPE TEXT", c2: "This is the droid you're looking for!", c3: "", c4: "", color: .red),
        .init(icon: "hourglass", command: "DELAY", c2: "10", c3: "", c4: "", color: .orange),
        .init(icon: "globe", command: "OPEN URL", c2: "http://jitbit.com", c3: "", c4: "", color: .red),
        .init(icon: "xmark.rectangle", command: "CLOSE WINDOW", c2: "*notepad*", c3: "", c4: "", color: .red),
        .init(icon: "photo", command: "FIND IMAGE", c2: "", c3: "", c4: "", color: .red),
        .init(icon: "cursorarrow.motionlines", command: "MOUSE", c2: "Move", c3: "X = 215", c4: "Y = 24", color: Color(red: 0.10, green: 0.62, blue: 0.18))
    ]

    var body: some View {
        VStack(spacing: 0) {
            topMenu
            mainToolbar
            mockStatusBar
            Divider()
            HStack(spacing: 0) {
                leftRail
                Divider()
                gridArea
            }
        }
        .frame(minWidth: 1220, minHeight: 780)
        .background(Color(red: 0.96, green: 0.96, blue: 0.97))
    }

    private var topMenu: some View {
        HStack(spacing: 12) {
            ForEach(["File", "Edit", "View", "Insert", "Actions", "Tools", "Help"], id: \.self) { item in
                Button(action: { selectedMenu = item }) {
                    Text(item)
                        .font(.system(size: 14))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(selectedMenu == item ? Color.blue.opacity(0.15) : Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                .buttonStyle(.plain)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(height: 30)
        .background(Color.white)
    }

    private var mainToolbar: some View {
        HStack(spacing: 0) {
            toolBig(icon: "record.circle.fill", text: "RECORD", color: .orange)
            toolBig(icon: "play.circle.fill", text: "PLAY", color: .orange)

            Rectangle().fill(Color.gray.opacity(0.25)).frame(width: 1, height: 48).padding(.horizontal, 16)

            dropdownLike("Record special")
            dropdownLike("Play special")

            Rectangle().fill(Color.gray.opacity(0.25)).frame(width: 1, height: 48).padding(.horizontal, 16)

            Button(action: { selectedToolbar = "Settings" }) {
                HStack(spacing: 8) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.gray)
                    Text("Settings")
                        .font(.system(size: 18))
                        .foregroundStyle(.black)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(selectedToolbar == "Settings" ? Color.blue.opacity(0.12) : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .buttonStyle(.plain)

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
    }

    private var mockStatusBar: some View {
        HStack {
            Text("Selected menu: \(selectedMenu)")
            Text("•")
            Text("Toolbar: \(selectedToolbar ?? "None")")
            Text("•")
            Text("Sidebar: \(selectedSidebar + 1)")
            Spacer()
            Text("Mockup only")
                .foregroundStyle(.secondary)
        }
        .font(.system(size: 12))
        .padding(.horizontal, 16)
        .frame(height: 26)
        .background(Color(red: 0.985, green: 0.985, blue: 0.99))
    }

    private func toolBig(icon: String, text: String, color: Color) -> some View {
        Button(action: { selectedToolbar = text }) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 34))
                    .foregroundStyle(color)
                Text(text)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .frame(width: 150, alignment: .leading)
            .background(selectedToolbar == text ? Color.blue.opacity(0.12) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
    }

    private func dropdownLike(_ text: String) -> some View {
        Button(action: { selectedToolbar = text }) {
            HStack(spacing: 6) {
                Text(text)
                    .font(.system(size: 17))
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .bold))
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .frame(width: 150, alignment: .leading)
            .background(selectedToolbar == text ? Color.blue.opacity(0.12) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
    }

    private var leftRail: some View {
        VStack(spacing: 0) {
            ForEach(sideItems.indices, id: \.self) { index in
                VStack(spacing: 0) {
                    Button(action: { selectedSidebar = index }) {
                        ZStack {
                            Rectangle()
                                .fill(index == selectedSidebar ? Color.blue.opacity(0.18) : Color.clear)
                            Image(systemName: sideItems[index])
                                .font(.system(size: 18))
                                .foregroundStyle(.black)
                        }
                        .frame(width: 58, height: 46)
                    }
                    .buttonStyle(.plain)
                    Rectangle().fill(Color.gray.opacity(0.18)).frame(height: 1)
                }
            }
            Spacer()
        }
        .frame(width: 58)
        .background(Color(red: 0.94, green: 0.94, blue: 0.95))
    }

    private var gridArea: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                header(width: 300, text: "Command")
                header(width: 320, text: "")
                header(width: 260, text: "")
                header(width: 260, text: "")
                Spacer(minLength: 0)
            }
            Rectangle().fill(Color.gray.opacity(0.18)).frame(height: 1)
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(Array(rows.enumerated()), id: \.element.id) { idx, row in
                        let isSelected = selectedRow == row.id || (selectedRow == nil && idx == rows.count - 1)
                        Button(action: { selectedRow = row.id }) {
                            HStack(spacing: 0) {
                                cell(width: 300, highlighted: isSelected) {
                                    HStack(spacing: 10) {
                                        Image(systemName: row.icon)
                                        Text(row.command)
                                            .font(.system(size: 17, weight: .medium))
                                    }
                                    .foregroundStyle(isSelected ? .white : row.color)
                                }
                                cell(width: 320, highlighted: isSelected) {
                                    Text(row.c2)
                                        .foregroundStyle(isSelected ? .white : row.color)
                                }
                                cell(width: 260, highlighted: isSelected) {
                                    Text(row.c3)
                                        .foregroundStyle(isSelected ? .white : row.color)
                                }
                                cell(width: 260, highlighted: isSelected) {
                                    Text(row.c4)
                                        .foregroundStyle(isSelected ? .white : row.color)
                                }
                                Spacer(minLength: 0)
                            }
                        }
                        .buttonStyle(.plain)
                        Rectangle().fill(Color.gray.opacity(0.14)).frame(height: 1)
                    }
                }
            }
            .background(.white)
        }
        .background(.white)
    }

    private func header(width: CGFloat, text: String) -> some View {
        HStack {
            Text(text)
                .font(.system(size: 14, weight: .medium))
            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(width: width, height: 34)
        .background(Color(red: 0.97, green: 0.97, blue: 0.98))
    }

    private func cell<Content: View>(width: CGFloat, highlighted: Bool, @ViewBuilder content: () -> Content) -> some View {
        HStack {
            content()
            Spacer()
        }
        .font(.system(size: 16))
        .padding(.horizontal, 12)
        .frame(width: width, height: 40)
        .background(highlighted ? Color(red: 0.20, green: 0.52, blue: 0.96) : Color.white)
    }

    private var sideItems: [String] {
        [
            "clock.arrow.circlepath",
            "cursorarrow.click.2",
            "hourglass",
            "doc.on.doc",
            "textformat",
            "folder",
            "wand.and.stars",
            "camera.viewfinder",
            "globe",
            "xmark.rectangle",
            "play.square",
            "slider.horizontal.3",
            "questionmark.circle"
        ]
    }
}

#Preview {
    ContentView()
}
