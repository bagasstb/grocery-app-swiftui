//
//  GroceryItem.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 21/12/25.
//

import Foundation

struct GroceryItem: Identifiable, Hashable {

  let id: UUID
  var name: String
  var notes: String
  var createdAt: Date

  init(id: UUID = UUID(), name: String, notes: String = "", createdAt: Date = .now) {
    self.id = id
    self.name = name
    self.notes = notes
    self.createdAt = createdAt
  }
}
