//
//  mapTestApp.swift
//  mapTest
//
//  Created by Kursat on 2.01.2021.
//

import SwiftUI

@main
struct mapTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           MapUIView()
        }
    }
}
