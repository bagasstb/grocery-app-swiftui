//
//  grocery_app_swiftuiApp.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import SwiftUI
import SwiftData

@main
struct grocery_app_swiftuiApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(for: PersistentGroceryItem.self)
  }
}
