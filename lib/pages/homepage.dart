import 'package:flutter/material.dart';
import 'package:testapp01/pages/bookings.dart';
import 'package:testapp01/pages/notifications.dart';
import 'package:testapp01/pages/settings.dart';
import 'package:testapp01/utils/bottom_Nav.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  /// Handles item taps and navigation
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // ✅ Moved the homepage UI inside _pages list
    Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          // Welcome User
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome, User',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // User Icon
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.person, size: 30, color: Colors.white),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Different Places
          Container(
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(20),
            height: 50,
          ),

          SizedBox(height: 20),

          // Today's Bookings
          Expanded(
            child: Container(
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    ),

    // Other pages
    BookingPage(),
    NotificationPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, 
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
