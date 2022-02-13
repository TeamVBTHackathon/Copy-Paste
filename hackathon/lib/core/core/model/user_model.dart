import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hackathon/core/core/model/comment_model.dart';
import 'package:hackathon/core/core/model/event_model.dart';

class UserModel {
  String id;
  String name;
  String email;
  String imageUrl;
  List<CommentModel>? comments;
  List<EventModel>? events;
  List<EventModel>? createdEvents;
  List<EventModel>? joinedEvents;
  List<EventModel>? likedEvents;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    List<CommentModel>? comments,
    List<EventModel>? events,
    List<EventModel>? createdEvents,
    List<EventModel>? joinedEvents,
    List<EventModel>? likedEvents,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot["email"],
      id: snapshot["id"],
      imageUrl: snapshot["imageUrl"],
      name: snapshot["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'comments': comments?.map((x) => x.toMap()).toList(),
      'events': events?.map((x) => x.toMap()).toList(),
      'createdEvents': createdEvents?.map((x) => x.toMap()).toList(),
      'joinedEvents': joinedEvents?.map((x) => x.toMap()).toList(),
      'likedEvents': likedEvents?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      comments: map['comments'] != null
          ? List<CommentModel>.from(
              map['comments']?.map((x) => CommentModel.fromMap(x)))
          : null,
      events: map['events'] != null
          ? List<EventModel>.from(
              map['events']?.map((x) => EventModel.fromMap(x)))
          : null,
      createdEvents: map['createdEvents'] != null
          ? List<EventModel>.from(
              map['createdEvents']?.map((x) => EventModel.fromMap(x)))
          : null,
      joinedEvents: map['joinedEvents'] != null
          ? List<EventModel>.from(
              map['joinedEvents']?.map((x) => EventModel.fromMap(x)))
          : null,
      likedEvents: map['likedEvents'] != null
          ? List<EventModel>.from(
              map['likedEvents']?.map((x) => EventModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
