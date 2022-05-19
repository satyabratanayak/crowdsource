import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdsource/Utilities/utils.dart';
import 'package:crowdsource/backend/models/model_events.dart';

class EventDatabase {
  static Future<String> createEvents(Event event) async {
    final docEvent = FirebaseFirestore.instance.collection('Events').doc();
    event.id = docEvent.id;
    await docEvent.set(event.toJson());
    return docEvent.id;
  }

  static Stream<List<Event>> readEvents() {
    return FirebaseFirestore.instance.collection('Events').snapshots().transform(Utils.transformer(Event.fromJson));
  }

  static Future updateEvent(Event event) async {
    final docEvent = FirebaseFirestore.instance.collection('Events').doc(event.id);
    await docEvent.update(event.toJson());
  }

  static Future deleteEvent(Event event) async {
    final docEvent = FirebaseFirestore.instance.collection('Events').doc(event.id);
    await docEvent.delete();
  }
}
