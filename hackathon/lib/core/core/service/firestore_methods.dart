// ignore_for_file: empty_catches

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/core/core/model/post.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadEvent({
    required String category,
    required String title,
    required String description,
    Uint8List? file,
    String? location,
    String? date,
  }) async {
    String photoUrl = '';
    if (file != null) {}
    String id = const Uuid().v4();

    await _firestore.collection('events').doc(id).set({
      'id': id,
      'category': category,
      'title': title,
      'description': description,
      'location': location ?? '',
      'date': date ?? '',
      'image': photoUrl,
      'commnets': [],
    });
    return id;
  }

  // upload post
  Future<String> uploadPost(
    String description,
    File? file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "Some error occured";
    try {
      String postId = const Uuid().v1();

      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: '',
          profImage: profImage,
          likes: []);

      _firestore.collection('posts').doc(postId).set(post.toJson());
      return "success";
    } catch (err) {
      res = err.toString();
      return res;
    }
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (err) {}
  }

  Future<void> postComment(String postId, String comment, String uid,
      String name, String profilePic) async {
    try {
      if (comment.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'comment': comment,
          'uid': uid,
          'name': name,
          'commentId': commentId,
          'profilePic': profilePic,
          'datePublished': DateTime.now()
        });
      } else {}
    } catch (err) {}
  }

  // deleting post

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (err) {}
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List<dynamic> following = (snap.data()! as dynamic)['following'];
      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (err) {}
  }
}
