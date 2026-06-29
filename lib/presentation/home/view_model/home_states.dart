import 'package:event_hub/domain/model/event_model.dart';

abstract class HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<EventModel> events;
  HomeSuccessState({this.events = const []});
}

class HomeErrorState extends HomeStates {
  final String errorMessage;
  HomeErrorState({required this.errorMessage});
}