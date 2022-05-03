import 'package:flutter/material.dart';

class TagProvider extends ChangeNotifier {
  bool? _tagInfluencer;

  bool get isInfluencer => _tagInfluencer ?? false;
  setTag(bool val) {
    _tagInfluencer = val;
    notifyListeners();
  }
}
