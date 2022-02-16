import 'package:flutter/material.dart';
import 'package:hackathon/features/messanger/chatPageJson.dart';
import 'package:hackathon/features/messanger/chat_detail_page_json.dart';
import 'package:hackathon/features/messanger/constant.dart';
import 'package:line_icons/line_icons.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(size),
    );
  }

  AppBar getAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      splashRadius: 25,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.black)),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(chats[0]['imageUrl']), fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(width: 1.5, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chats[0]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        'Online',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.videocam, color: Colors.grey),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.phone_in_talk, color: Colors.grey),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "Today",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(chatDetails.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ChatBubble(
                      isMe: chatDetails[index].isMe,
                      isSeen: chatDetails[index].isSeen,
                      imageUrl: chatDetails[index].imageUrl,
                      message: chatDetails[index].message,
                      messageNo: chatDetails[index].messageNo,
                      dateTime: chatDetails[index].dateTime,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: size.width * 0.82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: const Icon(Icons.add, color: Colors.cyan),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: (size.width - 30) * 0.56,
                        child: TextField(
                          cursorColor: Colors.black.withOpacity(0.5),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Message...',
                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: (size.width - 30) * 0.1,
                        alignment: Alignment.center,
                        child: const Text(
                          ":D",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: (size.width - 30) * 0.11,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.cyan),
                  child: const Icon(Icons.send, color: Colors.white, size: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe, isSeen;
  final String imageUrl, message, dateTime;
  final int messageNo;

  const ChatBubble({
    Key? key,
    required this.isMe,
    required this.isSeen,
    required this.imageUrl,
    required this.message,
    required this.dateTime,
    required this.messageNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: getBorderRadiusMessage(messageNo, isMe),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              isSeen == true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(LineIcons.doubleCheck, size: 14, color: Colors.grey),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            dateTime,
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          ));
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 2),
      child: Row(
        children: [
          Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: getBorderRadiusMessage(messageNo, isMe),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              isSeen
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const Icon(LineIcons.doubleCheck, size: 14, color: Colors.grey),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            dateTime,
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
