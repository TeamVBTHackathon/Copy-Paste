import 'package:flutter/material.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/features/eventDetail/event_detail_view.dart';
import 'package:hackathon/features/widgets/custom_appbar.dart';

import '../../core/constants/strings/profile_strings.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //ProfileStrings strings = ProfileStrings();
    const String randomImage = 'https://picsum.photos/200/300';

    Color _iconColor = Colors.grey.withOpacity(0.5);
    return Scaffold(
      appBar: const CustomAppbar(
        headline: ProfileStrings.headline,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0;
                      i < 8;
                      i++) //cekilen etkinlik sayisi kadar donecek
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EventDetail(),
                              ),
                            );
                          },
                          child: Container(
                            margin: context.paddingWithLowNormal,
                            height: context.hightValue,
                            width: context.widthValue,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 8.0,
                                    margin: const EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Image.network(
                                      randomImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        ProfileStrings.eventName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          ////////////////////////////////////////////////////////////////
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  margin: context.paddingWithLowNormal,
                  padding: context.paddingWithLowMedium,
                  height: context.widthValue,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffb21fac),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: context.hightValue / 3.5,
                        width: context.widthValue,
                        child: const Card(
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: Color(0xffb21fac),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: const [
                          Text(
                            ProfileStrings.newEvent,
                            style: TextStyle(
                                color: Color(0xffFFFF4B),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            ProfileStrings.organizeEvent,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10.0,
                  top: context.hightValue / 7,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xffFFFF4B),
                    ),
                  ),
                )
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////
          Expanded(
            flex: 1,
            child: TabBar(
              indicatorColor: const Color(0xffb21fac),
              labelColor: const Color(0xffb21fac),
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              controller: _controller,
              tabs: const [
                Tab(
                  text: ProfileStrings.allEvents,
                ),
                Tab(
                  text: ProfileStrings.savedEvent,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: SizedBox(
              height: context.height,
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  customListView(context, randomImage, _iconColor),
                  customListView(context, randomImage, _iconColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  customListView(BuildContext context, String randomImage, Color _iconColor) {
    return Container(
      padding: context.paddingWithLowNormal,
      child: ListView.builder(
        padding: context.paddingWithLowNormal,
        itemCount: 8, //gelecek olan verin kadar donecek
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: context.widthValue,
                    height: context.widthValue,
                    margin: context.paddingWithLowNormal,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 8.0,
                      margin: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Image.network(
                        randomImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      const Text(ProfileStrings.date),
                      const Text(
                        ProfileStrings.eventName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ProfileStrings.num,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 30.0,
                top: context.hightValue / 7,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        //onpressed calismiyor
                        setState(() {
                          if (_iconColor == Colors.grey.withOpacity(0.5)) {
                            _iconColor = const Color(0xffb21fac);
                          } else {
                            _iconColor = Colors.grey.withOpacity(0.5);
                          }
                        });
                      },
                      icon: const Icon(Icons.favorite),
                      color: _iconColor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment),
                      color: const Color(0xffb21fac),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
