#  Roqqu Mobile Developer Assessment

This repository contains my submission for the Roqqu Mobile Developer Flutter Assessment.  
It implements the Copy Trading interface from the provided Figma design and integrates **real-time cryptocurrency data** using the Binance WebSocket API.

---

## 🚀 Setup Instructions

### 1. Clone the Repository

git clone https://github.com/your-username/roqqu-assessment.git

cd roqqu-assessment


### 2. Install Dependencies


flutter pub get

### 3. Run the App


flutter run


### 4. Run Tests (Optional)


flutter test


---

## 🎥 Demo

Below is a recorded demo of the app running on an emulator, showcasing the copy trading interface and live WebSocket data updates:

🔗 [View Demo](https://github.com/user-attachments/assets/cadf133b-5e3d-4ec3-9271-9cb6670b0cfc)

---

## 📖 Project Overview

The project demonstrates a **Flutter-based copy trading dashboard** that connects to **Binance WebSocket streams** for real-time market data.
It displays **live trader performance**, **ROI charts**, and **animated UI components** consistent with the provided **Figma design**.

### 🧭 Key Objectives

* 🎨 Design fidelity to the provided Figma screens
* 🧱 Modular, maintainable architecture
* ⚡ Efficient WebSocket data handling
* 🌀 Smooth animations and responsive layouts
* 🧩 Clean theming and consistent typography

---

## 🧰 Tech Stack

| Category                | Tools / Packages                                     |
| ----------------------- | ---------------------------------------------------- |
| **Framework**           | Flutter (3.x)                                        |
| **Language**            | Dart                                                 |
| **State Management**    | Riverpod + Flutter Hooks                             |
| **WebSocket API**       | Binance Streams (`wss://stream.binance.com:9443/ws`) |
| **Responsive UI**       | flutter_screenutil                                   |
| **Charts & Animations** | fl_chart, AnimatedContainer, Tween animations        |
| **Testing**             | flutter_test                                         |

---

## Folder Structure

```bash
.
├── app.dart
├── main.dart
├── core
│   ├── constants          # App spacing, strings, and constants
│   ├── network
│   │   └── websocket      # WebSocket clients and connection logic
│   └── utils              # Theme and general utilities
├── features
│   ├── copy_trading       # Copy trading module
│   │   ├── data           # DTOs, enums, and mock data
│   │   ├── domain         # Repositories and services
│   │   └── presentation   # Views, viewmodels, widgets, and routes
│   ├── home               # Home dashboard module
│   │   ├── data
│   │   ├── domain
│   │   └── presentation
│   └── navigation         # App navigation setup
├── shared
│   ├── utils              # Shared utilities like colors, assets, and string helpers
│   └── widgets            # Reusable UI components
└── test                   # Unit tests
```

### 🎨 Design Implementation

* Layout matches the provided Figma design **pixel-for-pixel**
* Centralized theming and color management using:

  * `core/utils/theme.dart`
  * `shared/utils/app_colors.dart`
* Consistent component spacing, text styles, and colors across screens


### 🌐 Real-Time WebSocket Integration

| Section                     | File                          | Data Stream                    | Description                             |
| --------------------------- | ----------------------------- | ------------------------------ | --------------------------------------- |
| **Trading Details**         | `trading_details_view.dart`   | `/ws/{symbol}@ticker`          | Streams price movements for open trades |
| **User Dashboard (Copier)** | `user_dashboard.dart`         | Multiple `@miniTicker` streams | Updates ROI and performance statistics  |
| **Home Dashboard Cards**    | `dashboard_view.dart`         | `/ws/!ticker@arr`              | Streams overall market summaries        |



**Socket logic and connection management** are centralized under:
```bash
core/network/websocket/
├── binance_socket_client.dart
├── network_state.dart
└── socket_connection.dart
```

## 📊 Charts and Visualization

* Real-time updating **PnL chart** on the user dashboard
* Smooth **animations** for state transitions and live data updates
* Efficient **data rendering** with minimal rebuilds for performance


## 🏗️ Architecture Highlights

* **Feature-based folder organization** for scalability
* **Repository-service pattern** in `domain/` for clean data access
* **ViewModel layer** for WebSocket and state management (e.g., `stream_vm.dart`)
* **Shared widgets** for consistent UI components across views

## 🧪 Testing

Tests are located under the `/test` directory:

```bash
test/
├── binance_miniticker_dto_test.dart
└── binance_socket_client_test.dart
```

Run all tests using:

flutter test

