# CraftyBay - eCommerce Mobile App
![all (1)](https://github.com/user-attachments/assets/7cdf1353-9296-443e-8551-65fe01fddb83)

CraftyBay is a feature-rich eCommerce mobile application built using Flutter. It provides users with a seamless shopping experience, including product browsing, authentication, cart management, and checkout functionality.

## Features

- 🛒 **Product Listing & Categories** - Browse products by categories.
- 🔍 **Search Functionality** - Find products easily.
- 🛍 **Cart Management** - Add and remove products from the cart.
- 💳 **Checkout & Payment** - Secure order placement.
- 📜 **Product Details & Reviews** - View product descriptions and customer reviews.
- 🔐 **User Authentication** - Login and OTP verification.
- 📌 **Wishlist Feature** - Save favorite products for later.

## Tech Stack

- **Flutter** - For cross-platform app development.
- **Dart** - Programming language for Flutter.
- **GetX** - State management and dependency injection.
- **REST API** - Fetching and managing backend data.

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/craftybay.git
   ```
2. Navigate to the project directory:
   ```sh
   cd craftybay
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Screenshots

Here are some UI previews of the application:

![Screenshots](all.png)

## Folder Structure

```
lib/
│── main.dart  # Entry point of the app
│── models/    # Data models
│── views/     # UI screens
│── controllers/  # GetX Controllers for state management
│── services/  # API handling and backend services
│── widgets/   # Reusable UI components
```

## API Integration

The app connects to a REST API to fetch and update product data. Update the API endpoints in `services/api_service.dart` accordingly.

## Contributions

Feel free to contribute by creating pull requests or reporting issues.

## License

This project is licensed under the [MIT License](LICENSE).

---

Happy coding! 🚀

