//
//  GroceryEditorView.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import SwiftUI

struct GroceryEditorView: View {
  @Binding var item: GroceryItem
  
  var body: some View {
    Form {
      Section("Name") {
        TextField("Name", text: $item.name)
      }

      Section("Notes") {
        TextField("Notes", text: $item.notes, axis: .vertical)
          .lineLimit(3...6)
      }

      Section("Created") {
        Text(item.createdAt.formatted(date: .abbreviated, time: .shortened))
      }
    }
    .navigationTitle("Edit")
  }
}
