import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  // final Uint8 bannerImage;
  final String postTitle;
  final String agenda;
  final DateTime dateTime;
  final String eventType;
  final String regLink;

  Event({
    // required this.bannerImage,
    required this.postTitle,
    required this.agenda,
    required this.dateTime,
    required this.eventType,
    required this.regLink,
  });

  Map<String, dynamic> toJson() => {
        // "bannerImage": bannerImage,
        "postTitle": postTitle,
        "agenda": agenda,
        "dateTime": dateTime,
        "eventType": eventType,
        "regLink": regLink,
      };

  static Event fromJson(Map<String, dynamic> json) => Event(
        // bannerImage: json['bannerImage'],
        postTitle: json['postTitle'],
        agenda: json['agenda'],
        dateTime: json['dateTime'],
        eventType: json['eventType'],
        regLink: json['regLink'],
      );

  static Event fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Event(
      // bannerImage: snapshot['bannerImage'],
      regLink: snapshot['regLink'],
      postTitle: snapshot['postTitle'],
      agenda: snapshot['agenda'],
      dateTime: snapshot['dateTime'],
      eventType: snapshot['eventType'],
    );
  }
}
