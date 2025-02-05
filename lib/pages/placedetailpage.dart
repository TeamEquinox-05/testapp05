import 'package:flutter/material.dart';

class PlaceDetailPage extends StatefulWidget {
  final String placeName;

  const PlaceDetailPage({super.key, required this.placeName});

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.placeName),
        backgroundColor: Colors.transparent,  // Make AppBar transparent
        elevation: 0,  // Remove the shadow
        actions: [], // Optionally, remove actions or add custom ones
      ),
      body: Stack(
        fit: StackFit.expand,  // Make the Stack cover the full screen
        children: [
          Image.asset(
            'assets/images/${widget.placeName}.jpg',  // Add your image here
            fit: BoxFit.cover,  // Cover the screen with the image
          ),
          Center(
            child: Text(
              'Welcome to ${widget.placeName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,  // Ensure the text is visible on top of the image
              ),
            ),
          ),
        ],
      ),
    );
  }
}
