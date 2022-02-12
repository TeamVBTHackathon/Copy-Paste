import 'dart:convert';

class CommentModel {
  String id;
  String userId;
  String eventId;
  String comment;
  String createdAt;
  CommentModel({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.comment,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'eventId': eventId,
      'comment': comment,
      'createdAt': createdAt,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      eventId: map['eventId'] ?? '',
      comment: map['comment'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));
}
