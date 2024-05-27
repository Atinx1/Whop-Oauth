import 'package:flutter/material.dart'; // Import the Flutter material package

import 'login_page.dart'; // Import the LoginPage

void main() {
  runApp(MyApp()); // Wrap the application with MyApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App', // Set the title for the app (displayed in the app switcher)
      home: LoginPage(), // Set the LoginPage as the home screen
    );
  }
}
