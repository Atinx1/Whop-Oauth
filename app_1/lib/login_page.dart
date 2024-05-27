import 'package:animated_text_kit/animated_text_kit.dart'; // Import for animated text effects
import 'package:flutter/material.dart'; // Import the Flutter material package for building UIs
import 'auth_service.dart'; // Import the AuthService for authentication logic
import 'home_page.dart'; // Import the HomePage widget

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late Color myColor; // Variable to store the primary color
  late Size mediaSize; // Variable to store the screen size
  late AnimationController _controller; // Animation controller for button animation
  late Animation<double> _animation; // Animation object for button animation
  bool isButtonHovered = false; // Flag to track button hover state
  double _gradientPosition = 0.0; // Position for gradient animation

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a duration and vsync
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation in both directions
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut); // Apply easing curve to animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the primary color and screen size from the current context
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      // Container for background decoration
      decoration: _buildBackgroundAnimation(), // Apply animated background gradient
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make scaffold background transparent
        body: Stack(
          // Stack for layering widgets
          children: [
            Positioned(top: 80, child: _buildTop()), // Position top widgets
            Positioned(bottom: 0, child: _buildBottom()), // Position bottom widgets
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    // Widget for top section of the screen
    return FadeTransition(
      opacity: _animation, // Apply fade animation to top widgets
      child: SizedBox(
        width: mediaSize.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/k.png', // Display image from assets
              height: 100,
            ),
            AnimatedTextKit(
              // Apply animated text effect
              animatedTexts: [
                WavyAnimatedText(
                  'Whop Auth', // Text content
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    letterSpacing: 2,
                  ),
                ),
              ],
              isRepeatingAnimation: true, // Repeat the animation
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    // Widget for bottom section of the screen
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        // Card widget for login button
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLoginButton(), // Build login button
              const SizedBox(height: 20),
              _buildFooterText(), // Build footer text
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    // Widget for login button
    return Center(
      child: AnimatedContainer(
        // Animated container for button
        duration: const Duration(milliseconds: 300), // Animation duration
        curve: Curves.easeInOut, // Animation curve
        height: 60,
        width: isButtonHovered ? mediaSize.width * 0.9 : mediaSize.width * 0.8, // Button width based on hover state
        decoration: BoxDecoration(
          color: isButtonHovered ? Colors.blue : Colors.blueAccent, // Button color based on hover state
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          // Elevated button widget
          onPressed: () async {
            // Navigate to home screen immediately
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );

            // Start the authentication process
            try {
              print('Starting authentication...'); // Log authentication start
              await AuthService().authenticate(); // Call authentication method
            } catch (e) {
              print('Authentication failed: $e'); // Log authentication failure
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), // Button shape
            elevation: 0, // Button elevation
            backgroundColor: Colors.transparent, // Button background color
            shadowColor: Colors.transparent, // Button shadow color
            minimumSize: const Size.fromHeight(60), // Button minimum size
          ),
          onHover: (value) {
            // Update hover state when button is hovered
            setState(() {
              isButtonHovered = value;
            });
          },
          child: const Text("LOGIN WITH WHOP"), // Button text
        ),
      ),
    );
  }

  Widget _buildFooterText() {
    // Widget for footer text
    return Text(
      'Powered by Whop', // Footer text content
      style: TextStyle(
        color: myColor.withOpacity(0.8), // Text color with opacity
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  BoxDecoration _buildBackgroundAnimation() {
    // Method to build animated background gradient
    _gradientPosition += 0.0001; // Increment gradient position for animation
    if (_gradientPosition > 1.0) {
      _gradientPosition = 0.0; // Reset gradient position
    }
    return BoxDecoration(
      gradient: LinearGradient(
        // Linear gradient for animated background
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade200, // Gradient colors
          Colors.blue.shade400,
          Colors.blue.shade600,
          Colors.blue.shade800,
        ],
        stops: [
          _gradientPosition,
          _gradientPosition + 0.25,
          _gradientPosition + 0.5,
          _gradientPosition + 0.75,
        ],
      ),
    );
  }
}
