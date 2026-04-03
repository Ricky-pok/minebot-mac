import Foundation

struct ProfileStore {
    func save(_ profile: MacroProfile, to url: URL) throws {
        let data = try JSONEncoder().encode(profile)
        try data.write(to: url)
    }

    func load(from url: URL) throws -> MacroProfile {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(MacroProfile.self, from: data)
    }
}
