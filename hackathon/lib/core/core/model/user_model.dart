import 'package:hackathon/core/core/model/comment_model.dart';
import 'package:hackathon/core/core/model/event_model.dart';

class UserModel {
  String id;
  String name;
  String email;
  String password;
  String location;
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
    required this.password,
    required this.location,
    required this.imageUrl,
  });
}
