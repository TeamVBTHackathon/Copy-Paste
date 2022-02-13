// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/Size/home_page_size_constants.dart';
import 'package:hackathon/core/constants/icon/homepage_icon_constants.dart';
import 'package:hackathon/core/constants/padding/home_page_padding.dart';
import 'package:hackathon/core/core/model/event_model.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

class CategoriesEventCardWidget extends StatelessWidget {
  CategoriesEventCardWidget({
    Key? key,
    required this.foundEvent,
  }) : super(key: key);

  EventModel foundEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomePadding.homeBottomListViewPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            height: 125,
            child: Image.network(foundEvent.image, fit: BoxFit.contain),
          ),
          Padding(
            padding: HomePadding.homeBottomEventInformationPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1.4 km",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: HomePadding.homeBottomEventNamePadding,
                  child: Text(
                    foundEvent.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: HomePageSize.homeBottomEventName),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HomePageIcon.homeBottomLocationIcon,
                    Text(foundEvent.location)
                  ],
                ),
                SizedBox(
                  width: context.highWidthValue * 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/event-detail");
                    },
                    child: const Text("view event"),
                    style: ElevatedButton.styleFrom(
                      primary: ThemePurple.darkPurple,
                      textStyle: Theme.of(context).textTheme.button!.copyWith(
                            color: ThemePurple.whiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
