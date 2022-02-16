import 'package:flutter/material.dart';

@immutable
class ChatDetail {
  final bool isMe;
  final bool isSeen;
  final String imageUrl;
  final String message;
  final int messageNo;
  final String dateTime;

  const ChatDetail({
    required this.isMe,
    required this.isSeen,
    required this.imageUrl,
    required this.message,
    required this.messageNo,
    required this.dateTime,
  });

  factory ChatDetail.fromObject(item) {
    return ChatDetail(
      isMe: item["isMe"] as bool,
      isSeen: item["isSeen"] as bool,
      imageUrl: item["imageUrl"] as String,
      message: item["message"] as String,
      messageNo: item["messageNo"] as int,
      dateTime: item["dateTime"] as String,
    );
  }
}

List<ChatDetail> chatDetails = [
  {
    "isMe": false,
    "isSeen": true,
    "imageUrl":
        "https://media-exp1.licdn.com/dms/image/C4E03AQFpjzWMSKbXvQ/profile-displayphoto-shrink_100_100/0/1568648171357?e=1641427200&v=beta&t=picSL17u0W7zJ4MOuRbv4an-6mHkbcn3uEC4UquQRkQ",
    "message": "Merhaba Ahmet usta!",
    "messageNo": 0,
    "dateTime": "4:10 AM"
  },
  {
    "isMe": true,
    "isSeen": false,
    "imageUrl":
        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "message": "Thanks for your gentalman",
    "messageNo": 1,
    "dateTime": ""
  },
  {
    "isMe": true,
    "isSeen": true,
    "imageUrl":
        "https://media-exp1.licdn.com/dms/image/C4E03AQFpjzWMSKbXvQ/profile-displayphoto-shrink_100_100/0/1568648171357?e=1641427200&v=beta&t=picSL17u0W7zJ4MOuRbv4an-6mHkbcn3uEC4UquQRkQ",
    "message": "Can i help you.",
    "messageNo": 3,
    "dateTime": "4:15 AM"
  },
  {
    "isMe": false,
    "isSeen": false,
    "imageUrl":
        "https://media-exp1.licdn.com/dms/image/C4E03AQFpjzWMSKbXvQ/profile-displayphoto-shrink_100_100/0/1568648171357?e=1641427200&v=beta&t=picSL17u0W7zJ4MOuRbv4an-6mHkbcn3uEC4UquQRkQ",
    "message": "I made an order, today.",
    "messageNo": 1,
    "dateTime": ""
  },
  {
    "isMe": false,
    "isSeen": false,
    "imageUrl":
        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "message": "When you can send",
    "messageNo": 2,
    "dateTime": ""
  },
  {
    "isMe": false,
    "isSeen": true,
    "imageUrl":
        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "message": "Thanks",
    "messageNo": 3,
    "dateTime": "4:15 AM"
  },
  {
    "isMe": true,
    "isSeen": false,
    "imageUrl": "",
    "message": "Oh sure",
    "messageNo": 1,
    "dateTime": "",
  },
  {
    "isMe": true,
    "isSeen": false,
    "imageUrl": "",
    "message": "I think today",
    "messageNo": 2,
    "dateTime": "",
  },
  {
    "isMe": true,
    "isSeen": true,
    "imageUrl": "",
    "message": "No worries",
    "messageNo": 3,
    "dateTime": "4:16 AM",
  },
  {
    "isMe": false,
    "isSeen": true,
    "imageUrl":
        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "message": "We talk about a project on \nlinkedIn.",
    "messageNo": 0,
    "dateTime": "4:30 AM"
  },
  {
    "isMe": true,
    "isSeen": true,
    "imageUrl": "",
    "message": "Yes, I have some question.",
    "messageNo": 0,
    "dateTime": "4:33 AM"
  },
].map((e) => ChatDetail.fromObject(e)).toList();
