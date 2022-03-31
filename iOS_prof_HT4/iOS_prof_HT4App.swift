//
//  iOS_prof_HT4App.swift
//  iOS_prof_HT4
//
//  Created by Владимир Скоробогатько on 22.03.22.
//

import SwiftUI

@main
struct iOS_prof_HT4App: App {
    init() {
        ConfigManager.shared.configDI()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
