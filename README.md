# **Diamond Cart**

Diamond Cart is a Flutter application designed for **filtering, sorting, and managing diamonds** in
a **persistent cart**.  
The app follows **Clean Architecture** using the **BLoC pattern** for state management and is built
using **Flutter SDK version 3.29.2**.

## **Project Structure**

The project is organized into a **clean and scalable architecture** with the following layers:

### **1. Presentation Layer**

- Contains **UI components and widgets**.
- Interacts with the **BLoC layer** to receive and display data.
- Handles user input and sends it to the **BLoC layer**.

### **2. Application Layer (BLoC)**

- Manages the **state and business logic** of the app.
- Communicates with the **Repository layer** to fetch and process data.
- Uses **Flutter BLoC** for structured state management.

### **3. Domain Layer (Use Cases & Models)**

- Defines **business rules, use cases, and entities**.
- Ensures that logic remains independent of the UI and data layers.

### **4. Data Layer (Repository & Local Storage)**

- Acts as an **intermediary** between BLoC and the data source.
- Uses **Hive for persistent cart storage**.

---

## **Features**

✔ **Filter Diamonds** based on **Carat, Lab, Shape, Color, Clarity**.  
✔ **Sort Diamonds** by **Final Price & Carat Weight**.  
✔ **Add/Remove Diamonds** from the cart.  
✔ **Persistent Cart Storage** with **Total Carat, Total Price, Avg Price, Avg Discount**.  
✔ **BLoC for State Management** ensuring scalability.

---

## **Installation & Setup**

### **Prerequisites**

- Install **Flutter SDK 3.29.2**.
- Set up your development environment (**Android Studio / VS Code**).

### **Clone the Repository**

```sh
git clone https://github.com/your-username/diamond-cart-app.git
cd diamond-cart-app
```

### **Install Dependencies**

```sh
flutter pub get
```

### **Run the App**

```sh
flutter run
```

---

## **File Structure**

```
lib/
│── core/                     # Core utilities (constants, theme, etc.)
│── data/
│   ├── models/                # Data models (Diamond, CartItem)
│   ├── repositories/          # Repository layer for data fetching
│   ├── sources/               # Local storage (Hive)
│── domain/
│   ├── entities/              # Business entities
│   ├── usecases/              # Business logic (e.g., FilterDiamonds, GetCartSummary)
│── presentation/
│   ├── blocs/                 # BLoC State Management
│   ├── pages/                 # UI Pages (Filter, Result, Cart)
│   ├── widgets/               # Reusable UI Components
│── main.dart                  # Entry point
```

---

## **Dependencies**

This project uses the following dependencies:

- `flutter_bloc` → State management.
- `hive` → Local persistent storage.
- `path_provider` → File path utilities.
- `equatable` → Value-based equality for BLoC.

To install missing dependencies, run:

```sh
flutter pub get
```

---

## **Contact**

For any inquiries or issues, please reach out to **[sonidivyang58@gmail.com]**.

