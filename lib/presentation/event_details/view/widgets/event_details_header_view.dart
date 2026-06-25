import 'package:event_hub/data/model/event_model.dart';
import 'package:flutter/material.dart';

class EventDetailsHeaderView extends StatelessWidget {
  const EventDetailsHeaderView({super.key,  this.eventModel});

  final EventModel? eventModel;
  @override
  Widget build(BuildContext context) {
    const double headerHeight = 350;
    const double imageHeight = 300;
    return SizedBox(
      height: headerHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: imageHeight,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // Replace with eventModel.imageUrl or your specific property
                  image:  NetworkImage(
                    eventModel?.imageUrl ?? 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?q=80&w=1000',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                    stops: const [0.0, 0.4],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Event Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    // Bookmark Button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.bookmark, color: Colors.white),
                        onPressed: () {
                          // Handle bookmark action
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20, // Pushes it down so it overlaps the bottom of the image
            left: 32,
            right: 32,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Stacked Avatars
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: Stack(
                      children: [
                        _buildAvatar('https://i.pravatar.cc/100?img=1', 0),
                        _buildAvatar('https://i.pravatar.cc/100?img=2', 20),
                        _buildAvatar('https://i.pravatar.cc/100?img=3', 40),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Going Text
                  const Text(
                    '+20 Going',
                    style: TextStyle(
                      color: Color(0xFF5B67FA), // Matches the blue in the image
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),

                  // Invite Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B67FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Invite',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAvatar(String url, double leftOffset) {
  return Positioned(
    left: leftOffset,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2), // The white stroke
      ),
      child: CircleAvatar(radius: 18, backgroundImage: NetworkImage(url)),
    ),
  );
}
