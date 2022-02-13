import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? location;
  String? date;
  String? time;
  String? category;
  List<String>? comments;
  List<String>? likes;
  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.location,
    required this.date,
    required this.time,
    required this.category,
    this.comments,
    this.likes,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'location': location,
      'date': date,
      'time': time,
      'category': category,
      'comments': comments,
      'likes': likes,
    };
  }

   EventModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data()!,);

      EventModel.fromJson(Map<String, dynamic> json,) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    location = json['location'];
    date = json['date'];
    time = json['time'];
    category = json['category'];
     
       

  }

  factory EventModel.fromMap(DocumentSnapshot<Map<String, dynamic>> map) {
    return EventModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      location: map['location'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      category: map['category'] ?? '',
      comments: List<String>.from(map['comments']),
      likes: List<String>.from(map['likes']),
    );
  }

  String toJson() => json.encode(toMap());

  // factory EventModel.fromJson(String source) =>
  //     EventModel.fromMap(json.decode(source));
}
