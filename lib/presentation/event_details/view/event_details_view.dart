import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_builder.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_buy_button.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_header_view.dart';
import 'package:event_hub/presentation/saved_events/view_model/cubit/saved_events_cubit.dart';
import 'package:event_hub/domain/repository/saved_events_repo.dart';
import 'package:event_hub/presentation/saved_events/view_model/states/saved_events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final eventModel =
        ModalRoute.of(context)!.settings.arguments as EventModel?;
    if (eventModel == null) {
      return Scaffold(body: Center(child: Text(context.tr('no_event_data'))));
    }

    return BlocProvider(
      create: (context) => SavedEventsCubit(
        savedEventsRepository: context.read<SavedEventsRepository>(),
      )..loadSavedStatus(eventModel.id),
      child: BlocListener<SavedEventsCubit, SavedEventsState>(
        listener: (context, state) {
          final messageKey = state.messageKey;
          if (messageKey != null && messageKey.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(context.tr(messageKey))));
          }
        },
        child: Scaffold(
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
                    buildEventDetails(context, eventModel),
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
        ),
      ),
    );
  }
}
