import 'package:flutter/material.dart';

class HomeImageScreen extends StatelessWidget {
  const HomeImageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/bom-conselho.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
