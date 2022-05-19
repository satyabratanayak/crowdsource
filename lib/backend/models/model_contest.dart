import 'package:cloud_firestore/cloud_firestore.dart';

class Contest {
  String id;
  DateTime dateTime;
  bool isContest;
  bool isOnline;
  String postTitle;
  String agenda;
  String regLink;
  String posterUrl;
  String influencerUID;
  String influencerName;
  String influencerProfile;

  Contest({
    required this.id,
    required this.influencerName,
    required this.influencerProfile,
    required this.influencerUID,
    required this.dateTime,
    required this.isContest,
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
        "isContest": isContest,
        "isOnline": isOnline,
        "postTitle": postTitle,
        "agenda": agenda,
        "regLink": regLink,
        "posterUrl": posterUrl,
      };

  static Contest fromJson(Map<String, dynamic> json) {
    Timestamp? stamp = json['dateTime'];
    // print("time stamp is : $stamp");
    DateTime? date = stamp?.toDate();

    // print("datetime is : $date");
    // print("the object is : ${json['id']} ");
    // print("the object is : ${json['isContest']} ");
    // print("the object is : ${json['isOnline']} ");
    // print("the object is : ${json['postTitle']} ");
    // print("the object is : ${json['agenda']} ");
    // print("the object is : ${json['regLink']} ");
    // print("the poster is : ${json['posterUrl']} ");

    return Contest(
      id: json['id'],
      influencerName: json['influencerName'],
      influencerProfile: json['influencerProfile'],
      influencerUID: json['influencerUID'],
      dateTime: date ?? DateTime.now(),
      isContest: json['isContest'],
      isOnline: json['isOnline'],
      postTitle: json['postTitle'],
      agenda: json['agenda'],
      regLink: json['regLink'],
      posterUrl: json['posterUrl'],
    );
  }

  // static Contest fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;
  //   return Contest(
  //     id: snapshot['id'],
  //     posterUrl: snapshot['posterUrl'],
  //     postURL: snapshot['postURL'],
  //     regLink: snapshot['regLink'],
  //     postTitle: snapshot['postTitle'],
  //     agenda: snapshot['agenda'],
  //     dateTime: snapshot['dateTime'],
  //     ContestType: snapshot['ContestType'],
  //     // createdTime: snapshot['createdTime'],
  //   );
}
