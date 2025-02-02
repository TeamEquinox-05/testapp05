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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> bookings = [
    {
      "title": "Elon Musk's Talk",
      "time": "10:00 AM",
      "Booked By": "Sanjeet Sir"
    },
    {
      "title": "AI Conference",
      "time": "12:00 PM",
      "Booked By": "Rhugved Dangui"
    },
    {
      "title": "Flutter Workshop",
      "time": "3:00 PM",
      "Booked By": "Unknown Sir"
    },
  ];
  final List<Map<String, String>> places = [
    {
      "place": "Auditorium",
    },
    {
      "place": "Techspace",
    },
    {
      "place": "CC Lab",
    },
    {
      "place": "L11",
    },
    
  ];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(Icons.person, size: 30, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16.0, // Horizontal space between items
                    mainAxisSpacing: 16.0,
                    crossAxisCount: 2),
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      places[index]['place']!,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            //list of bookings
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Today\'s Bookings',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20.0),
                child: bookings.isEmpty
                    ? Center(
                        child: Text(
                          'No Bookings Found',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: bookings.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.deepPurpleAccent,
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bookings[index]['title']!,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          bookings[index]['Booked By']!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  bookings[index]['time']!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
    _pages.addAll([BookingPage(), NotificationPage(), SettingsPage()]);
  }

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
