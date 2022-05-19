import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  DateTime dateTime;
  bool isEvent;
  bool isOnline;
  String postTitle;
  String agenda;
  String regLink;
  String posterUrl;
  String influencerUID;
  String influencerName;
  String influencerProfile;

  Event({
    required this.id,
    required this.influencerName,
    required this.influencerProfile,
    required this.influencerUID,
    required this.dateTime,
    required this.isEvent,
    required this.isOnline,
    required this.postTitle,
    required this.agenda,
    required this.regLink,
    required this.posterUrl,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "influencerUID": influencerUID,
        "influencerName": influencerName,
        "influencerProfile": influencerProfile,
        "dateTime": dateTime,
        "isEvent": isEvent,
        "isOnline": isOnline,
        "postTitle": postTitle,
        "agenda": agenda,
        "regLink": regLink,
        "posterUrl": posterUrl,
      };

  static Event fromJson(Map<String, dynamic> json) {
    Timestamp? stamp = json['dateTime'];
    // print("time stamp is : $stamp");
    DateTime? date = stamp?.toDate();

    // print("datetime is : $date");
    // print("the object is : ${json['id']} ");
    // print("the object is : ${json['isEvent']} ");
    // print("the object is : ${json['isOnline']} ");
    // print("the object is : ${json['postTitle']} ");
    // print("the object is : ${json['agenda']} ");
    // print("the object is : ${json['regLink']} ");
    // print("the poster is : ${json['posterUrl']} ");

    return Event(
      id: json['id'],
      influencerName: json['influencerName'],
      influencerProfile: json['influencerProfile'],
      influencerUID: json['influencerUID'],
      dateTime: date ?? DateTime.now(),
      isEvent: json['isEvent'],
      isOnline: json['isOnline'],
      postTitle: json['postTitle'],
      agenda: json['agenda'],
      regLink: json['regLink'],
      posterUrl: json['posterUrl'],
    );
  }

  // static Event fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;
  //   return Event(
  //     id: snapshot['id'],
  //     posterUrl: snapshot['posterUrl'],
  //     postURL: snapshot['postURL'],
  //     regLink: snapshot['regLink'],
  //     postTitle: snapshot['postTitle'],
  //     agenda: snapshot['agenda'],
  //     dateTime: snapshot['dateTime'],
  //     eventType: snapshot['eventType'],
  //     // createdTime: snapshot['createdTime'],
  //   );
}
