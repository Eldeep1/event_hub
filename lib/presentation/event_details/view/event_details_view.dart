import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_builder.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_buy_button.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_header_view.dart';
import 'package:flutter/material.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final eventModel =
        ModalRoute.of(context)!.settings.arguments as EventModel?;
    if (eventModel == null) {
      return const Scaffold(
        body: Center(child: Text('No event data available')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            // Add bottom padding so content isn't hidden behind the floating button
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventDetailsHeaderView(eventModel: eventModel),
                buildEventDetails(eventModel),
              ],
            ),
          ),

          // Floating Buy Ticket Button
          Positioned(
            bottom: 30,
            left: 32,
            right: 32,
            child: buildBuyTicketButton(),
          ),
        ],
      ),
    );
  }
}
