# Groceries (SwiftUI)

<p align="center">
  <img src="README_assets/app-icon-256.png" width="128" height="128" alt="App Icon" />
</p>

A tiny **SwiftUI iOS 17** sample app to learn the basics of building modern UI:
- **List + Navigation**
- **Add / Edit / Delete**
- **Search**
- Two implementations side-by-side:
  - **In-Memory (MVVM + Observation)**
  - **SwiftData persistence**

---

## Features

### In-Memory tab
- MVVM using **Observation** (`@Observable`)
- List → Edit screen
- Add item sheet
- Search + delete (works even while filtered)

### SwiftData tab
- Persistent storage using **SwiftData**
- `@Model`, `@Query`, `ModelContext`
- Add / edit / delete
- Search

---

## Screenshots

<p align="center">
  <img src="README_assets/screenshot-in-memory-360.png" width="220" alt="In-Memory tab" />
  <img src="README_assets/screenshot-swiftdata-360.png" width="220" alt="SwiftData tab" />
  <img src="README_assets/screenshot-search-active-360.png" width="220" alt="Search active" />
</p>

<p align="center">
  <img src="README_assets/screenshot-edit-screen-360.png" width="220" alt="Edit item screen" />
  <img src="README_assets/screenshot-edit-mode-360.png" width="220" alt="Edit mode (delete rows)" />
</p>

---

## Tech Stack
- **SwiftUI**
- **Observation** (iOS 17)
- **SwiftData** (iOS 17)

---

## Requirements
- Xcode 15+
- iOS 17+

---

## Getting Started
1. Clone the repo
2. Open the Xcode project
3. Run on an iOS 17+ simulator/device

---

## Project Structure (suggested)
- `Models/` – app models (in-memory + SwiftData `@Model`)
- `ViewModels/` – MVVM view models for the in-memory tab
- `Views/` – SwiftUI screens + components
