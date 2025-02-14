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
      
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
         title: Text(widget.placeName,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'WorkSans',shadows: [BoxShadow(color: Colors.black, blurRadius: 10)]),),
            backgroundColor: Colors.transparent,  // Make AppBar transparent
            elevation: 0,  // Remove the shadow
            pinned: true,  // Pin the AppBar to the top
            expandedHeight: 300,  // Set the height of the expanded AppBar
              // Remove the shadow
        iconTheme: IconThemeData(color: Colors.white,shadows: [BoxShadow(color: Colors.black, blurRadius: 10)]), 
         // Optionally, remove actions or add custom ones
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.only(bottom: 15), // Space for shadow visibility
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4), // Shadow color
                      blurRadius: 10, // Softness of shadow
                      spreadRadius: 2, // How much shadow spreads
                      offset: Offset(0, 5), // Shadow position
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ), 
                  
                child: Image.asset(
                  'assets/images/${widget.placeName}.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
