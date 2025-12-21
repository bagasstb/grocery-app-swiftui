//
//  GroceryDetailView..swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import SwiftUI

struct GroceryDetailView: View {
  
  let item: GroceryItem

  var body: some View {
    Form {
      Section("Name") {
        Text(item.name)
      }
      Section("Notes") {
        Text(item.notes.isEmpty ? "—" : item.notes)
          .foregroundStyle(item.notes.isEmpty ? .secondary : .primary)
      }
      Section("Created") {
        Text(item.createdAt.formatted(date: .abbreviated, time: .shortened))
      }
    }
    .navigationTitle("Detail")
  }
}
