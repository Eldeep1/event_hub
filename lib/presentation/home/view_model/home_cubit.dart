import 'package:event_hub/data/model/event_model.dart';
import 'package:event_hub/presentation/home/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeLoadingState());
  var events = [
    EventModel(
      title: 'Music Concert',
      location: 'New York City',
      imageUrl:
          'https://www.crucial.com.au/blog/wp-content/uploads/2014/12/events_medium.jpg',
      price: 50.0,
      organizerName: 'Ashfak Sayem',
      description:
          'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
      date: '14 December, 2021',
      time: 'Tuesday, 4:00PM - 9:00PM',
    ),
    EventModel(
      title: 'Music Concert',
      location: 'New York City',
      imageUrl:
          'https://www.crucial.com.au/blog/wp-content/uploads/2014/12/events_medium.jpg',
      price: 50.0,
      organizerName: 'Ashfak Sayem',
      description:
          'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
      date: '14 December, 2021',
      time: 'Tuesday, 4:00PM - 9:00PM',
    ),
  ];
  void fetchEvents() async {
    emit(HomeLoadingState());
    try {
      // Simulate fetching events from an API or database
      // on the future, it will be replaced with repo call
      await Future.delayed(Duration(seconds: 2));
      if (!isClosed) {
        emit(HomeSuccessState(events: events));
      }
    } catch (e) {
      print(e.toString());
      if (!isClosed) {
        emit(HomeErrorState(errorMessage: e.toString()));
      }
    }
  }
}
