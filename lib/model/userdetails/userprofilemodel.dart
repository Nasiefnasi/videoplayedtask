import 'package:cloud_firestore/cloud_firestore.dart';

class Userprofile {
  String? name;
  String? imageUrl;
  String? emails;
  String? dob;

  Userprofile({
    required this.name,
    required this.imageUrl,
    required this.emails,
    required this.dob,
  });

  factory Userprofile.fromMap(DocumentSnapshot map) {
    Map<String, dynamic>? data = map.data() as Map<String, dynamic>?;

    return Userprofile(
      name: data?['name'] ?? '',
      imageUrl: data?['imageurl'] ?? '',
      emails: data?['emails'] ?? '',
      dob: data?['dob'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageurl': imageUrl,
      'emails': emails,
      'dob': dob,
    };
  }
}
