import 'package:flutter/material.dart';
import 'package:hackathon/features/utils/comments.dart';
import 'package:hackathon/features/widgets/comment_card.dart';
import 'package:hackathon/features/widgets/custom_appbar.dart';

class CommentsScreen extends StatefulWidget {
  final String postId;
  const CommentsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    commentList;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(
          headline: 'Yorumlar',
          isBackButton: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CommentCard(snap: commentList[index]);
          },
          itemCount: commentList.length,
        ),
      ),
    );
  }
}
