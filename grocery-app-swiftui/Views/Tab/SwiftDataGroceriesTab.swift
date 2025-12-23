//
//  SwiftDataGroceriesTab.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 23/12/25.
//

import SwiftUI
import SwiftData

struct SwiftDataGroceriesTab: View {
  
  @Environment(\.modelContext) private var modelContext
  @Query(sort: [SortDescriptor(\PersistentGroceryItem.createdAt, order: .reverse)])
  private var items: [PersistentGroceryItem]
  
  @State private var isAddPresented = false
  @State private var searchText = ""
  
  private var filteredItems: [PersistentGroceryItem] {
    let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    guard !q.isEmpty else { return items }
    return items.filter { $0.name.lowercased().contains(q) || $0.notes.lowercased().contains(q) }
  }
  
  var body: some View {
    NavigationStack {
      List {
        if !searchText.isEmpty && filteredItems.isEmpty {
          ContentUnavailableView("No results", systemImage: "magnifyingglass",
                                 description: Text("Try a different keyword."))
        } else {
          ForEach(filteredItems, id: \.id) { item in
            NavigationLink {
              SwiftDataGroceryEditorView(item: item)
            } label: {
              VStack(alignment: .leading, spacing: 4) {
                Text(item.name).font(.headline)
                if !item.notes.isEmpty {
                  Text(item.notes).font(.subheadline).foregroundStyle(.secondary)
                }
              }
            }
          }
          .onDelete(perform: delete)
        }
      }
      .navigationTitle("Groceries")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) { EditButton() }
        ToolbarItem(placement: .topBarTrailing) {
          Button { isAddPresented = true } label: { Image(systemName: "plus") }
        }
      }
      .searchable(text: $searchText, prompt: "Search groceries")
      .sheet(isPresented: $isAddPresented) {
        AddPersistentGroceryView { name, notes in
          let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
          guard !trimmed.isEmpty else { return }
          modelContext.insert(PersistentGroceryItem(name: trimmed, notes: notes))
        }
      }
    }
  }
  
  private func delete(at offsets: IndexSet) {
    // offsets refer to filteredItems, so delete those objects
    for offset in offsets {
      modelContext.delete(filteredItems[offset])
    }
  }
}

struct SwiftDataGroceryEditorView: View {
  let item: PersistentGroceryItem
  
  var body: some View {
    Form {
      Section("Name") {
        TextField("Name", text: Binding(get: { item.name }, set: { item.name = $0 }))
      }
      Section("Notes") {
        TextField("Notes (optional)",
                  text: Binding(get: { item.notes }, set: { item.notes = $0 }),
                  axis: .vertical)
        .lineLimit(3...6)
      }
      Section("Created") {
        Text(item.createdAt.formatted(date: .abbreviated, time: .shortened))
      }
    }
    .navigationTitle("Edit")
  }
}

struct AddPersistentGroceryView: View {
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
        ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
        ToolbarItem(placement: .confirmationAction) {
          Button("Save") { onSave(name, notes); dismiss() }
            .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
      }
    }
  }
}

#Preview {
  SwiftDataGroceriesTab()
}
