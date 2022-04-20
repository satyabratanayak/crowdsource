import 'package:flutter/material.dart';

showButtonsnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: const Duration(milliseconds: 500),
  ));
}
