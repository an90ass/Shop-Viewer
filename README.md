# Shop Viewer

The **Shop Viewer** is a Flutter-based mobile application designed to allow users to browse and view products by categories. The app fetches data from an external API using HTTP requests and dynamically updates the product list when a category is selected.

## Features
- View a list of product categories.
- Browse products by selecting a category.
- Dynamically updated product list.
- Data fetched from an external API.

## Requirements
- **Flutter SDK**: Make sure Flutter is installed on your machine.
- **Node.js**: Required to serve the local API.
- **json-server**: For running the local JSON API.
- **db.json file**: The product and category data file.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/an90ass/Shop-Viewer.git
   cd Shop-Viewer

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
3. **Download the db.json file: Place the db.json file in the root directory of your project.**
   
4. **Install JSON Server**: Make sure you have Node.js installed, then install json-server globally:
   ```bash
   npm install -g json-server
   
5. **Run the API server**: In the root folder where db.json is located, run the following command:
   ```bash
   json-server --watch db.json
   
6. **Run the Flutter app**: After ensuring the API server is running, start the Flutter application:
   ```bash
   flutter run


   





 





