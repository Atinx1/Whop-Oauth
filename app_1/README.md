# **_Whop Authentication App_**

This project is a Flutter application for authenticating users with the Whop API using OAuth2.

## Table of Contents-:

-Introduction
-Features
-Getting Started
-Prerequisites
-Installation
-Usage
-Contributing
-License

## Introduction-:

    The Whop Authentication App is designed to facilitate user authentication with the Whop API, enabling users to securely log in and access their Whop accounts from within the app.

## Features-:

    User-friendly login interface
    OAuth2 authentication with Whop API
    Seamless navigation to home screen upon successful authentication
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### **main.dart->

This file serves as the entry point for your Flutter application. Here's a breakdown of its logic and functionality:

Imports: Import necessary packages and files, including the login_page.dart.
Main Function: The main() function is the entry point of the application. It calls the runApp() function with an instance of the MyApp widget.
MyApp Widget: The MyApp widget is a StatelessWidget that configures the MaterialApp with the title and sets the initial route to the LoginPage.


### **login_page.dart->

This file defines the LoginPage widget responsible for the login screen UI and functionality. Here's what it does:

Imports: Import necessary packages and files, including animated_text_kit for animated text effects and auth_service.dart for authentication logic.
LoginPage Widget: This is a StatefulWidget that creates the login screen UI.
State: The _LoginPageState class manages the state of the LoginPage.
Initialization: It initializes animation controllers, colors, and screen size.
Build Method: The build() method constructs the UI with a background animation, top and bottom sections, and login button.
Background Animation: _buildBackgroundAnimation() method creates an animated gradient background.
Top Section: _buildTop() method constructs the top section with an animated logo and text.
Bottom Section: _buildBottom() method constructs the bottom section with a login button and footer text.
Login Button: _buildLoginButton() method creates a login button with hover animation and triggers authentication.
Footer Text: _buildFooterText() method displays footer text.
Animation: Utilizes animation controllers and CurvedAnimation to animate UI elements.


### **auth_service.dart->

This file contains the AuthService class responsible for handling authentication with the Whop API using OAuth2. Here's a breakdown:

Imports: Import necessary packages for OAuth2 authentication and HTTP requests.
AuthService Class: This class encapsulates authentication logic.
Properties: It defines properties for client ID, client secret, redirect URI, authorization endpoint, and token endpoint.
Authenticate Method: authenticate() initiates the authentication process by opening a web view with the authorization URL and waits for the result.
Handle Redirect Method: handleRedirect() extracts the authorization code from the redirect URI and exchanges it for an access token using OAuth2 flow.
Error Handling: It handles errors during authentication and token retrieval.


### **home_page.dart->

This file defines the HomePage widget displayed after successful authentication. Here's its functionality:

Imports: Import necessary packages and confetti.dart for confetti animations.
HomePage Widget: This widget displays a congratulatory message and confetti animation upon successful authentication.
Initialization: It initializes the confetti controller.
Build Method: The build() method constructs the UI with an app bar and confetti animation.

By following these explanations, users can understand the purpose and functionality of each file in your Flutter application.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Getting Started-:

    To get started with the Whop Authentication App, follow the instructions below.

## Prerequisites-:

    Before running the application, make sure you have the following installed:

  Flutter SDK
  Dart SDK
  IDE (e.g., Android Studio, VS Code) with Flutter plugin
  Installation
  Clone the repository to your local machine:
     --git clone https://github.com/your-username/whop-authentication-app.git

   Navigate to the project directory:

      --cd whop-authentication-app
   Install dependencies using Flutter:

      --flutter pub get


## Usage-:

  To use the Whop Authentication App, follow these steps:

    Run the application on your preferred emulator or physical device.
    Enter your Whop credentials on the login screen.
    Click the "LOGIN WITH WHOP" button to initiate the authentication process.
    Upon successful authentication, you will be redirected to the home screen.


## Contributing-: 

    Contributions to the Whop Authentication App are welcome! To contribute:

        Fork the repository.
        Create a new branch for your feature or bug fix.
        Make your changes and commit them with descriptive messages.
        Push your changes to your fork.
        Submit a pull request to the main repository.

## License-:

    This project is licensed under the MIT License - see the LICENSE file for details.
    Feel free to customize this template further to include additional information or tailor it to your project's specific needs.


