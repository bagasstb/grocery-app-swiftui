//
//  GroceryListViewModel.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class GroceryListViewModel {

  var items: [GroceryItem] = [
    GroceryItem(name: "Eggs", notes: "Free-range"),
    GroceryItem(name: "Milk"),
    GroceryItem(name: "Coffee", notes: "Beans if possible")
  ]

  func add(name: String, notes: String) {
    let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return }
    items.insert(GroceryItem(name: trimmed, notes: notes), at: 0)
  }

  func delete(at offsets: IndexSet) {
    items.remove(atOffsets: offsets)
  }
  
  func item(id: UUID) -> GroceryItem? {
    items.first { $0.id == id }
  }
}
