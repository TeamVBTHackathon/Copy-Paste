// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/core/model/user_model.dart';
import 'package:hackathon/core/core/providers/user_provider.dart';
import 'package:hackathon/core/core/service/firestore_methods.dart';
import 'package:hackathon/features/comments/comments_screen.dart';
import 'package:hackathon/features/utils/utils.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  final snap;
  const PostView({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  bool isLikeAnimating = false;
  int commentsLength = 0;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  void getComments() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentsLength = snap.docs.length;
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    setState(() {
      commentsLength = commentsLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey, width: 1, style: BorderStyle.solid)),
      child: Column(
        children: [
          // header section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    widget.snap['profImage'],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.snap['username'],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                            child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ]
                              .map(
                                (e) => InkWell(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(e)),
                                    onTap: () async {
                                      FirestoreMethods()
                                          .deletePost(widget.snap['postId']);
                                      Navigator.of(context).pop();
                                    }),
                              )
                              .toList(),
                        )),
                      );
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          // image section
          GestureDetector(
            onDoubleTap: () async {
              await FirestoreMethods().likePost(
                widget.snap['postId'],
                user.id,
                widget.snap['likes'],
              );
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(widget.snap['postUrl'], fit: BoxFit.cover),
            ),
          ),
          // Like comment section
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommentsScreen(
                          postId: widget.snap,
                        ))),
                icon: const Icon(Icons.comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                ),
              ),
            ],
          ),
          // Descrioption and number of comments section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w800),
                  child: Text('${widget.snap['likes'].length} likes',
                      style: Theme.of(context).textTheme.bodyText2),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 5),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.pink),
                      children: [
                        TextSpan(
                            text: widget.snap['username'],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' ${widget.snap['description']}'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '$commentsLength comments',
                      style: const TextStyle(
                          fontSize: 16, color: Colors.pinkAccent),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    style:
                        const TextStyle(fontSize: 12, color: Colors.pinkAccent),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
