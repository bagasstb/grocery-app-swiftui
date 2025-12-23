//
//  PersistentGroceryItem.swift
//  grocery-app-swiftui
//
//  Created by Satrio Teleng Bagaskoro on 23/12/25.
//

import Foundation
import SwiftData

@Model
final class PersistentGroceryItem {
  var id: UUID
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
