//
//  ContentView.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      InMemoryGroceriesTab()
        .tabItem {
          Label("In-Memory", systemImage: "list.bullet")
        }

      SwiftDataGroceriesTab()
        .tabItem {
          Label("SwiftData", systemImage: "externaldrive")
        }
    }
  }
}

#Preview {
  ContentView()
}
