import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdsource/Utilities/import.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Utils {
  static pickimage({required BuildContext context, required ImageSource source}) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    showButtonsnack(context, "No Image Selected");
  }

  static threeWordFormat(String object) {
    if (object.length < 3) {
      return object;
    } else {
      return object.substring(0, 3);
    }
  }

  static dateFormat(DateTime dateTime) {
    return DateFormat('dd').format(dateTime);
  }

  static monthFormat(DateTime dateTime) {
    String value = DateFormat('MMMM').format(dateTime);

    return threeWordFormat(value);
  }

  static timeFormat(DateTime dateTime) {
    return DateFormat('KK:mm a').format(dateTime);
  }

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>> transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final objects = snaps.map((json) => fromJson(json as Map<String, dynamic>)).toList();

          sink.add(objects);
        },
      );
}
