//
//  grocies_appApp.swift
//  grocies-app
//
//  Created by Fauzan Ghozi Mubarak on 31/10/23.
//

import SwiftUI

@main
struct grocies_appApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
