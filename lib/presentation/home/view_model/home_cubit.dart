import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:event_hub/presentation/home/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final EventRepository eventRepository;

  HomeCubit({required this.eventRepository}) : super(HomeLoadingState());

  List<EventModel> events = [];

  Future<void> fetchEvents() async {
    emit(HomeLoadingState());
    try {
      final loadedEvents = await eventRepository.getEvents(
        startDateTime: DateTime.now(),
        sortAsc: true,
      );
      if (!isClosed) {
        events = loadedEvents;
        emit(HomeSuccessState(events: events));
      }
    } catch (e) {
      if (!isClosed) {
        emit(HomeErrorState(errorMessage: e.toString()));
      }
    }
  }
}
