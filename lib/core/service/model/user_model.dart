import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserInfos {
  UserInfos(
      {required this.username,
      required this.firstName,
      required this.image,
      required this.follow,
      required this.uid,
      required this.claimsName,
      required this.following,
      required this.anonimName,
      required this.claimsId,
      required this.backgroundImage,
      required this.description});

  final String? username;
  final String? firstName;
  final String? image;
  final List<String>? follow;
  final String? uid;
  final String? claimsName;
  final List<String?>? following;
  final String? anonimName;
  final String? claimsId;
  final String? backgroundImage;
  final String? description;

  factory UserInfos.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      String claimsName,
      String claimsId) {
    final data = snapshot.data();
    return UserInfos(
      description: data?["Description"],
      backgroundImage: data?["BackgroundImage"],
      anonimName: data?["AnonimName"],
      claimsName: claimsName,
      claimsId: claimsId,
      firstName: data?["FirstName"],
      following:
          data?['Following'] is Iterable ? List.from(data?['Following']) : null,
      image: data?["Image"],
      uid: data?["Uid"],
      username: data?["Username"],
      follow: data?['Follow'] is Iterable ? List.from(data?['Follow']) : null,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$username $firstName $claimsId $claimsName";
  }
}

class Claims {
  String ClaimsId;

  String ClaimsName;
  Claims({
    required this.ClaimsId,
    required this.ClaimsName,
  });

  Claims copyWith({
    String? ClaimsId,
    String? ClaimsName,
  }) {
    return Claims(
      ClaimsId: ClaimsId ?? this.ClaimsId,
      ClaimsName: ClaimsName ?? this.ClaimsName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ClaimsId': ClaimsId,
      'ClaimsName': ClaimsName,
    };
  }

  factory Claims.fromMap(Map<String, dynamic> map) {
    return Claims(
      ClaimsId: map['ClaimsId'] ?? '',
      ClaimsName: map['ClaimsName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Claims.fromJson(String source) => Claims.fromMap(json.decode(source));

  @override
  String toString() => 'Claims(ClaimsId: $ClaimsId, ClaimsName: $ClaimsName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Claims &&
      other.ClaimsId == ClaimsId &&
      other.ClaimsName == ClaimsName;
  }

  @override
  int get hashCode => ClaimsId.hashCode ^ ClaimsName.hashCode;
}
