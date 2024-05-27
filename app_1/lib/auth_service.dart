import 'dart:convert'; // Import the 'dart:convert' library for JSON encoding and decoding
import 'dart:js'; // Import 'dart:js' for handling redirection
import 'home_page.dart'; // Import the HomePage widget
import 'package:flutter_web_auth/flutter_web_auth.dart'; // Import the Flutter Web Auth package for OAuth2 authentication
import 'package:http/http.dart' as http; // Import the HTTP package for making HTTP requests
import 'package:oauth2/oauth2.dart' as oauth2; // Import the OAuth2 package for OAuth2 authentication
import 'package:flutter/material.dart'; // Import the Flutter material package for building UIs

/*
This code implements the OAuth2 authentication flow with the Whop API using the Flutter Web Auth package and the OAuth2 package.

The `AuthService` class contains the following:

1. Constants for the client ID, client secret, redirect URI, authorization endpoint, and token endpoint obtained from the Whop API.
2. The `authenticate` method constructs the authorization URL with the required parameters and opens it in a web view using the `FlutterWebAuth.authenticate` method.
3. The `handleRedirect` method is called after the user authenticates and is redirected back to the app. It extracts the authorization code from the redirect URI and exchanges it for an access token by making a POST request to the token endpoint.
4. Upon successful authentication, the user is navigated to the `HomePage` widget.

The code also includes print statements for debugging purposes, which output the authorization URL, authentication result, authorization code, token response status, and token response body.

Note: One need to replace the placeholders for the client ID, client secret, and other Whop API details with the actual values provided by Whop.
*/

class AuthService {
  final String clientId = 'app_U16a6g4TWNErvZ'; // Client ID obtained from the Whop API
  final String clientSecret = 'LDRijVDjq0q6EqCz8WOfGCrhk_m4vyiAoRXA7d_VsoM'; // Client secret obtained from the Whop API
  final String redirectUri = 'myapp://callback'; // Redirect URI registered with the Whop API
  final String authorizationEndpoint = 'https://auth.whop.com/oauth/authorize'; // Authorization endpoint for OAuth2 authentication
  final String tokenEndpoint = 'https://auth.whop.com/oauth/token'; // Token endpoint for OAuth2 authentication

  // Method to initiate the authentication process
  Future<void> authenticate() async {
    // Construct the authorization URL with required parameters
    final authorizationUrl = Uri.parse(
        '$authorizationEndpoint?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&scope=openid profile email');

    // Print the authorization URL for debugging
    print('Authorization URL: $authorizationUrl');

    // Open the authorization URL in a web view and wait for the result
    final result = await FlutterWebAuth.authenticate(
      url: authorizationUrl.toString(),
      callbackUrlScheme: Uri.parse(redirectUri).scheme,
    );

    // Print the authentication result for debugging
    print('Authentication result: $result');
  }

  // Method to handle the redirection after authentication
  Future<void> handleRedirect(Uri uri) async {
    final code = uri.queryParameters['code']; // Extract the authorization code from the URI query parameters

    // Print the authorization code for debugging
    print('Authorization code: $code');

    if (code == null) {
      // Throw an exception if the authorization code is missing
      throw Exception('Failed to obtain authorization code');
    }

    // Exchange the authorization code for an access token by making a POST request to the token endpoint
    final response = await http.post(
      Uri.parse(tokenEndpoint),
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );

    // Print the token response status for debugging
    print('Token response status: ${response.statusCode}');

    // Print the token response body for debugging
    print('Token response body: ${response.body}');

    if (response.statusCode == 200) {
      final credentials = oauth2.Credentials.fromJson(response.body); // Parse the response body to obtain OAuth2 credentials

      // Navigate to the home screen upon successful authentication
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Throw an exception if the access token could not be obtained
      throw Exception('Failed to obtain access token');
    }
  }
}

