import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/domain/repository/saved_events_repo.dart';
import 'package:event_hub/presentation/events_view/view/widgets/events_view_events_list.dart';
import 'package:event_hub/presentation/saved_events/view_model/cubit/saved_events_cubit.dart';
import 'package:event_hub/presentation/saved_events/view_model/states/saved_events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedEventsView extends StatelessWidget {
  const SavedEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedEventsCubit(
        savedEventsRepository: context.read<SavedEventsRepository>(),
      )..loadSavedEvents(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            context.tr('saved_events'),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<SavedEventsCubit, SavedEventsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.savedEvents.isEmpty) {
              return Center(
                child: Text(
                  context.tr('no_saved_events'),
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return EventsViewEventList(events: state.savedEvents);
          },
        ),
      ),
    );
  }
}
