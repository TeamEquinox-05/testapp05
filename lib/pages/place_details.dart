import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:timelines/timelines.dart';
import 'package:testapp01/pages/bookings.dart';

class PlaceDetailsPage extends StatefulWidget {
  final String placeName;
  final String imageUrl;

  const PlaceDetailsPage({
    super.key,
    required this.placeName,
    required this.imageUrl,
  });

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;
  final double _expandedHeight = 300;
  final double _collapsedHeight = 150;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > _expandedHeight - _collapsedHeight &&
        !_isCollapsed) {
      setState(() => _isCollapsed = true);
    } else if (_scrollController.offset <= _expandedHeight - _collapsedHeight &&
        _isCollapsed) {
      setState(() => _isCollapsed = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: _expandedHeight,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.placeName,
                style: TextStyle(
                  color: _isCollapsed ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(),
              background: Hero(
                tag: 'place_${widget.placeName}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s Bookings',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 16),
                  _buildTodayTimeline(),
                  const SizedBox(height: 32),
                  Text(
                    'Booking History',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 16),
                  _buildBookingHistory(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingsPage(
                initialPlaceName: widget.placeName,
              ),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Book Now'),
      ).animate().scale(),
    );
  }

  Widget _buildTodayTimeline() {
    // Example bookings - replace with actual data
    final bookings = [
      {'time': '09:00 - 10:00', 'user': 'John Doe', 'status': 'Completed'},
      {'time': '11:00 - 12:00', 'user': 'Jane Smith', 'status': 'In Progress'},
      {'time': '14:00 - 15:00', 'user': 'Mike Johnson', 'status': 'Upcoming'},
    ];

    return SizedBox(
      height: 200,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0.1,
          connectorTheme: const ConnectorThemeData(
            thickness: 2.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: bookings.length,
          contentsBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        bookings[index]['time']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(bookings[index]['user']!),
                    ],
                  ),
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            return DotIndicator(
              color: _getStatusColor(bookings[index]['status']!),
            );
          },
          connectorBuilder: (_, index, ___) {
            return SolidLineConnector(
              color: _getStatusColor(bookings[index]['status']!),
            );
          },
        ),
      ),
    ).animate().fadeIn().slideY();
  }

  Widget _buildBookingHistory() {
    // Example history - replace with actual data
    final history = [
      {'date': 'March 6', 'user': 'Alice Brown', 'duration': '2 hours'},
      {'date': 'March 5', 'user': 'Bob Wilson', 'duration': '1 hour'},
      {'date': 'March 4', 'user': 'Carol White', 'duration': '3 hours'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: history.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.history),
            ),
            title: Text(history[index]['user']!),
            subtitle: Text('${history[index]['date']} • ${history[index]['duration']}'),
          ),
        ).animate().fadeIn().slideX();
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'In Progress':
        return Colors.blue;
      case 'Upcoming':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
