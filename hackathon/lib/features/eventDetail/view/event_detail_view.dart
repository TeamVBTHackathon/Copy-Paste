// ignore_for_file: must_be_immutable

library event_detail_view;

import 'package:flutter/material.dart';
import 'package:hackathon/core/core/model/event_model.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/text_theme_light.dart';
import 'package:hackathon/core/init/theme/theme.dart';
import 'package:hackathon/features/comments/comments_screen.dart';

import '../../../core/constants/strings/event_detail_strings.dart';

part 'parts/about_content.dart';
part 'parts/join_button.dart';
part 'parts/participant_content.dart';
part 'parts/top_content.dart';
part 'parts/schedules_content.dart';

TextStyle headerStyle = const TextStyle(
    fontFamily: FONT_FAMILY,
    fontSize: 22,
    fontWeight: FontWeight.normal,
    color: Colors.white);
TextStyle hostTextStyle = const TextStyle(
    fontFamily: FONT_FAMILY,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.yellow);
TextStyle aboutStyle =
    TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 13);

class EventDetailView extends StatefulWidget {
  EventModel foundEvent;
  EventDetailView({Key? key, required this.foundEvent}) : super(key: key);

  static const routeName = '/event-detail';

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Join butona kadar olan kısım
            SizedBox(
              //color: Colors.blue,
              height: context.height * 8 / 10,
              child: Column(
                children: [
                  //ArrowBack and favorite Icon
                  header(),

                  //Top Content
                  TopContentWidget(
                      widget.foundEvent.name, widget.foundEvent.location),

                  //About Content
                  AboutContentWidget(EventDetailStrings.aboutsText),

                  //Next Schadule
                  SchedulesContentWidget(
                      eventDate: widget.foundEvent.date,
                      timeRange: widget.foundEvent.time,
                      eventType: widget.foundEvent.category,
                      duration: widget.foundEvent.time),
                ],
              ),
            ),

            //Alt Bölüm
            SizedBox(
              //color: Colors.red,
              height: context.height * 2 / 10,
              child: Column(
                children: const [
                  //Participant profile
                  ParticipantContentWidget(),

                  //Join Button
                  JoinButtonWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Container header() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
            icon: Icon(
              favorite == false ? Icons.favorite_outline : Icons.favorite,
              color: theme.primaryColor,
              size: 35,
            ),
            onPressed: () => setState(() {
                  favorite = !favorite;
                })),
      ]),
    );
  }
}
