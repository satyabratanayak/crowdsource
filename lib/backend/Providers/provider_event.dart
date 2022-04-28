import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  bool? _tagEvent;

  bool get isEvent => _tagEvent ?? false;
  setTag(bool val) {
    _tagEvent = val;
  }
}
