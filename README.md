# Flutter Weather App

A simple weather application built with Flutter. This app fetches the current weather data based on the user's location and allows searching for weather in different cities.

## Features

- Get current weather based on device location
- Search for weather in any city
- Detailed weather information
- Clean and user-friendly UI

## Screenshots

1. **Ask Permission for Location**
   
   ![Ask Permission for Location](![Screenshot_20240712-231652](https://github.com/user-attachments/assets/07bf52d5-bb03-441a-857e-fb343d58a8a9))

2. **Current Location Weather UI**
   
   ![Current Location Weather UI](![Screenshot_20240712-231802](https://github.com/user-attachments/assets/d9cc3783-a47a-4f68-a48a-197f75a0eeca))


3. **Detailed Weather Information**
   
   ![Detailed Weather Information](![Screenshot_20240712-231811](https://github.com/user-attachments/assets/573c1854-3505-48e4-ad5d-59ef4e7682be)
)

4. **Search for City Weather**
   
   ![Search for City Weather](![Screenshot_20240712-232029](https://github.com/user-attachments/assets/d9432a40-c1eb-4c71-9133-4ecc970a2860))

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/your_username/flutter_weather_app.git
    cd flutter_weather_app
    ```

2. Install dependencies:

    ```sh
    flutter pub get
    ```

3. Run the app:

    ```sh
    flutter run
    ```

## Usage

1. **Location Permission**: The app will request location permission when first launched. Grant the permission to allow the app to fetch the weather data based on your current location.
2. **Current Location Weather**: The main screen displays the weather information for your current location.
3. **Detailed Weather**: Click on the weather card to view more detailed weather information.
4. **Search City Weather**: Use the search functionality to find weather information for any city.

## Dependencies

- [geolocator](https://pub.dev/packages/geolocator): To fetch the current location of the device.
- [http](https://pub.dev/packages/http): To make API requests.
- [provider](https://pub.dev/packages/provider): State management.

## Weather API

The app uses a weather API to fetch weather data. You need to sign up for an API key from a weather service provider (e.g., OpenWeatherMap, Weatherstack) and add it to the app.

1. Sign up for an API key.
2. Add the API key to your project:

    ```dart
    const String apiKey = 'YOUR_API_KEY';
    ```

## Contributing

Contributions are welcome! Please submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

