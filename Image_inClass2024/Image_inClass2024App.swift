//
//  Image_inClass2024App.swift
//  Image_inClass2024
//
//  Created by Owen Hildreth on 3/27/24.
//

import SwiftUI
import SwiftData


@main
struct Image_inClass2024App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Node.self, ImageItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
        Settings {
            PreferencesView()
        }
    }
}
