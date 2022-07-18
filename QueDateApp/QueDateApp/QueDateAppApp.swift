//
//  QueDateAppApp.swift
//  QueDateApp
//
//  Created by Ilya Zelkin on 18.07.2022.
//

import SwiftUI
import Firebase

@main
struct QueDateAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
