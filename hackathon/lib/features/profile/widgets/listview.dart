import 'package:flutter/material.dart';

import 'package:hackathon/core/extension/context_extension.dart';

import '../../../core/constants/icon/profilepage_icon_constants.dart';
import '../../../core/constants/radius/profile_page_radius.dart';
import '../../../core/constants/strings/profile_strings.dart';
import '../../../core/init/theme/theme_purple.dart';

class ListViewWidget extends StatefulWidget {
  Color iconColor;
  ListViewWidget({
    Key? key,
    required this.iconColor,
  }) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  String randomImage = 'https://picsum.photos/200/300';
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingWithLowNormal,
      child: ListView.builder(
        padding: context.paddingWithLowNormal,
        itemCount: 8, //gelecek olan veri kadar donecek
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
                      margin: context.noPadding,
                      shape: RoundedRectangleBorder(
                        borderRadius: ProfilePageRadius.generalRadius,
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
                          color: ThemePurple.blackOpacityColor,
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
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      icon: Icon(
                        isFavourite == false
                            ? Icons.favorite_outline
                            : Icons.favorite,
                      ),
                      color: widget.iconColor,
                    ),
                    IconButton(
                        onPressed: () {}, icon: ProfilePageIcon.commentIcon),
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
