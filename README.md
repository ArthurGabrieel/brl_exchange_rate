# BRL Exchange Rate

A Flutter application that provides current and historical exchange rates for the Brazilian Real (BRL) against other currencies. The app allows users to search for exchange rates by currency code and view detailed information, including daily exchange rates for the last 30 days.

## Project Structure

The app follows the Clean Architecture principles, dividing the code into the following layers:
- Presentation: UI components, widgets, and state management (Bloc).
- Domain: Business logic, use cases, and entities.
- Data: Data sources, repositories, and models.

## Features

- Current Exchange Rate: Get the latest exchange rate between BRL and the selected currency.
- Historical Data: View daily exchange rates for the past 30 days.
- Percentage Difference: See the percentage change between consecutive days.
- Interactive UI: Expandable cards with smooth animations to display historical data.
- Error Handling: User-friendly error messages for network issues or invalid input.

## Getting Started

This project runs on Flutter 3.24.5 and Dart 3.5.4. Make sure you have Flutter installed on your machine before running the app. To run the app, follow these steps:

1. Clone the repository:

    ```git clone https://github.com/yourusername/brl_exchange_rate.git ```

2. Navigate to the project directory:

    ```cd brl_exchange_rate```

3. Install dependencies:

    ```flutter pub get```

4. Run the app, either on an emulator or a physical device:

    ```flutter run```

