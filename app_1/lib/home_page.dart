import 'package:flutter/material.dart'; // Import the Flutter material package for building UIs
import 'package:confetti/confetti.dart'; // Import the Confetti package for adding confetti animations

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController _confettiController; // Controller for managing the confetti animation

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 5)); // Initialize the confetti controller with a duration of 5 seconds
    _confettiController.play(); // Start the confetti animation
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Dispose of the confetti controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Set the app bar title to 'Home'
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              'Hurry!!  Authentication Successful!', // Display a text indicating successful authentication
              style: TextStyle(
                color: Theme.of(context).primaryColor, // Use the primary color of the current theme
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: _confettiController, // Pass the confetti controller to the ConfettiWidget
            blastDirectionality: BlastDirectionality.explosive, // Set the blast directionality to explosive
            shouldLoop: false, // Set the confetti animation to not loop
            colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow], // Define the colors of the confetti
          ),
        ],
      ),
    );
  }
}
