//
//  BookingAppApp.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//

import SwiftUI

@main
struct BookingAppApp: App {
    @ObservedObject var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: coordinator)
        }
    }
}
