import 'package:event_hub/presentation/organizer_profile/view/widgets/organizer_profile_about_tab.dart';
import 'package:event_hub/presentation/organizer_profile/view/widgets/organizer_profile_events_tab.dart';
import 'package:event_hub/presentation/organizer_profile/view/widgets/organizer_profile_header_section.dart';
import 'package:event_hub/presentation/organizer_profile/view/widgets/organizer_profile_review_tab.dart';
import 'package:flutter/material.dart';

class OrganizerProfileView extends StatelessWidget {
  const OrganizerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(child: buildProfileHeader()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: Color(0xFF5B67FA),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFF5B67FA),
                    indicatorWeight: 3,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(text: 'ABOUT'),
                      Tab(text: 'EVENT'),
                      Tab(text: 'REVIEWS'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [buildAboutTab(), buildEventsTab(), buildReviewsTab()],
          ),
        ),
      ),
    );
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, 
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}