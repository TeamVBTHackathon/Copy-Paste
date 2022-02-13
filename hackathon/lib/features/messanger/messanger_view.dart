import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/messanger/ChatDetailPage.dart';
import 'package:hackathon/features/messanger/chatPageJson.dart';

class MessangerView extends StatefulWidget {
  const MessangerView({Key? key}) : super(key: key);
  static const routeName = '/messenger';

  @override
  _MessangerViewState createState() => _MessangerViewState();
}

class _MessangerViewState extends State<MessangerView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(size),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      title: const Text(
        "Message",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.black),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.black),
        ),
      ],
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 45,
            width: size.width - 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: TextField(
                cursorColor: Colors.black.withOpacity(0.5),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  hintText: 'Ara',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: List.generate(chats.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ChatDetailPage()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 55,
                          width: (size.width - 30) * 0.14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(chats[index]['imageUrl']),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.3, color: Colors.white),
                              color: chats[index]['active'] == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 55,
                      width: (size.width - 30) * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chats[index]['name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            chats[index]['message'],
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 55,
                      width: (size.width - 30) * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chats[index]['time'],
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          chats[index]['unread'] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ThemePurple.darkPurple,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 3),
                                    child: Text(
                                      chats[index]['unread'].toString(),
                                      style: const TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                )
                              : const Icon(Icons.more_horiz, size: 20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
