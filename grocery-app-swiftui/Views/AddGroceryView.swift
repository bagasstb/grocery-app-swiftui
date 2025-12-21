//
//  AddGroceryView.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import SwiftUI

struct AddGroceryView: View {
  @Environment(\.dismiss) private var dismiss

  @State private var name = ""
  @State private var notes = ""

  let onSave: (_ name: String, _ notes: String) -> Void
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Name", text: $name)
        TextField("Notes (optional)", text: $notes, axis: .vertical)
          .lineLimit(3...6)
      }
      .navigationTitle("Add Item")
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") { dismiss() }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Save") {
            onSave(name, notes)
            dismiss()
          }
          .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
      }
    }
  }
}
