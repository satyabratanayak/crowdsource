import 'package:crowdsource/backend/Firebase/database_events.dart';
import 'package:crowdsource/backend/models/model_events.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  bool? _tagEvent;

  bool get isEvent => _tagEvent ?? false;
  setTag(bool val) {
    _tagEvent = val;
    notifyListeners();
  }

  // String? _error;
  List<Event> _events = [];

  // String? get error => _error;
  List<Event> get eventList => _events;

  // void setError(String err) => WidgetsBinding.instance?.addPostFrameCallback((_) {
  //       _error = err;
  //       notifyListeners();
  //     });

  void setEvent(List<Event> events) => WidgetsBinding.instance?.addPostFrameCallback((_) {
        _events = events;
        notifyListeners();
      });

  void createEvent(Event event) => EventDatabase.createEvents(event);

  void deleteEvent(Event event) => EventDatabase.deleteEvent(event);

  void updataEvent(Event event) => EventDatabase.updateEvent(event);
}
