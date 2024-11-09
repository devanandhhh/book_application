## Book application

A Flutter application for managing books and authors, featuring user authentication, book listings, author details, and book ratings.


## Screens

### 1. **User Authentication**
- **Registration**: Users can create an account using a username, password, and confirm password.
- **JWT Token Storage**: After successful registration, a JWT token is securely stored using `SharedPreferences` to persist user login state.
- **Auto-login**: On app launch, if a JWT token is found in the local storage, the app automatically logs in the user and navigates to the Home Screen.

### 2. **Home Screen**
- **Books List**: Displays a list of available books, each showing the title, author, and star ratings.
- **Search Functionality**: A search bar allows users to search for books based on title.

### 3. **Book Details Screen**
- **Detailed Book Information**: Users can view more details about a selected book, including a description, author information, and a list of ratings.

### 4. **Authors Screen**
- **List of Authors**: Displays all available authors and their details, including a biography, books written, and ratings for each book.


## Dependencies

This project uses the following dependencies:
- **flutter_bloc**: A package for implementing BLoC pattern for state management.
- **shared_preferences**: Used for saving user JWT tokens.
- **http**: To handle API requests.
- **flutter_lottie**: For adding Lottie animations.
- **flutter_rating_bar**:For adding the rating .
- **go_router**:For route management.
- **google_fonts**:For gettin beauitiful fonts
- **internet_connection_checker** : for checking the network

**Network Connection Check**
To improve user experience, the app performs a check for an internet connection before performing key actions like login, registration, and fetching authors' data.

-**Login & Registration Pages*: 
-**Authors Screen*: 

