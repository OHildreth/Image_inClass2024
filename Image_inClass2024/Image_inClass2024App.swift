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
    @State var appController = AppController()
    
    
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(appController)
        
        Settings {
            PreferencesView()
        }
    }
}
