// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hackathon/core/core/model/event_model.dart';

import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/features/homepage/eventdata/eventdata.dart';

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
  bool isFavourite = false;
  List<EventModel> list = events;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingWithLowNormal,
      child: ListView.builder(
        padding: context.paddingWithLowNormal,
        itemCount: list.length, //gelecek olan veri kadar donecek
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: context.widthValue,
                    height: context.height * 0.15,
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
                        list[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(list[index].date),
                      Text(
                        list[index].name,
                        style: const TextStyle(
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
