//
//  ContentView.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import SwiftUI
import Observation

struct ContentView: View {
  @State private var vm = GroceryListViewModel()
  @State private var isAddPresented = false
  @State private var searchText = ""

  var body: some View {
    @Bindable var bindableVM = vm

    NavigationStack {
      content(items: $bindableVM.items, searchText: searchText)
        .navigationTitle("Groceries")
        .toolbar { toolbarContent }
        .searchable(text: $searchText, prompt: "Search groceries")
        .sheet(isPresented: $isAddPresented) {
          addSheet
        }
    }
  }

  private func content(
    items: Binding<[GroceryItem]>,
    searchText: String
  ) -> some View {
    let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

    let filteredIndices: [Int] = {
      guard !query.isEmpty else { return Array(items.wrappedValue.indices) }
      return items.wrappedValue.indices.filter { index in
        let item = items.wrappedValue[index]
        return item.name.lowercased().contains(query) || item.notes.lowercased().contains(query)
      }
    }()

    return List {
      if !query.isEmpty && filteredIndices.isEmpty {
        ContentUnavailableView(
          "No results",
          systemImage: "magnifyingglass",
          description: Text("Try a different keyword.")
        )
      } else {
        ForEach(filteredIndices, id: \.self) { index in
          let item = items.wrappedValue[index]
          NavigationLink {
            GroceryEditorView(item: items[index])
          } label: {
            GroceryRow(item: item)
          }
        }
        .onDelete { offsets in
          delete(items: items, displayedOffsets: offsets, filteredIndices: filteredIndices)
        }
      }
    }
  }

  private func delete(
    items: Binding<[GroceryItem]>,
    displayedOffsets: IndexSet,
    filteredIndices: [Int]
  ) {
    // Map visible offsets back to the actual indices in the source array.
    let actualIndices = displayedOffsets
      .map { filteredIndices[$0] }
      .sorted(by: >)

    for index in actualIndices {
      items.wrappedValue.remove(at: index)
    }
  }

  @ToolbarContentBuilder
  private var toolbarContent: some ToolbarContent {
    ToolbarItem(placement: .topBarLeading) {
      EditButton()
    }
    ToolbarItem(placement: .topBarTrailing) {
      Button {
        isAddPresented = true
      } label: {
        Image(systemName: "plus")
      }
    }
  }

  private var addSheet: some View {
    AddGroceryView { name, notes in
      vm.add(name: name, notes: notes)
    }
  }
}

private struct GroceryRow: View {
  let item: GroceryItem

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(item.name).font(.headline)
      if !item.notes.isEmpty {
        Text(item.notes)
          .font(.subheadline)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  ContentView()
}
