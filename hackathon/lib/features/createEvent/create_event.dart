library create_event.dart;

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/Size/create_events_size_constants.dart';
import 'package:hackathon/core/constants/padding/create_event_padding.dart';
import 'package:hackathon/core/constants/radius/create_event_radius.dart';
import 'package:hackathon/core/constants/strings/createEvent_strings.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/createEvent/globalmethods/globalemethods.dart';
import 'package:hackathon/features/createEvent/widgets/mytext.dart';
import 'package:image_picker/image_picker.dart';

part 'parts/create_event_titlecontent.dart';
part 'parts/create_event_submitbutton.dart';
part 'parts/create_event_descriptioncontent.dart';

part 'parts/create_event_selectimage.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);
  static const routeName = '/create-event';
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();
  int selectValue = 0;
  List items = ["Bussiness", "Public Fun", "Meet"];
  List cities = ["Ankara", "Antalya", "Bursa"];
  var productTitle = '';

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  GlobalMethods _globalMethods = GlobalMethods();

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: CreateEventPadding.createEventSingleScrollPadding,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            //select Photo
                            AddImageContainer(image),

                            //select Event Title
                            EventTitleContent(
                                titleController: _titleController),

                            // add event description
                            EventDescriptionContent(
                              descriptionController: _descriptionController,
                            ),

                            //select event Category
                            selectCategory(),
                            selectCity(),
                          ],
                        ),
                        SizedBox(
                            //color: Colors.black,
                            height: context.height * 1 / 11,
                            child: SubmitButton(_formKey))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container selectCity() {
    return Container(
      margin: CreateEventPadding.selectCityMargin,
      padding: CreateEventPadding.selectCityPadding,
      decoration: BoxDecoration(
        borderRadius: CreateEventRadius.createEventSelectCity,
        border: Border.all(width: 1, color: ThemePurple.blackColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(cities[selectValue].toString(), 20, ThemePurple.blackColor),
          SizedBox(
            height: 50,
            width: 200,
            child: CupertinoButton.filled(
                child: const SizedBox(
                    //height: 150,
                    // color: Colors.black,
                    width: 250,
                    child: Text(
                      CreateEventStrings.selectCity,
                      style: TextStyle(fontSize: CreateEventsSize.sizedBox),
                    )),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            actions: [buildPicker(cities)],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text(CreateEventStrings.cancel),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ));
                }),
          ),
        ],
      ),
    );
  }

  Container selectCategory() {
    return Container(
      margin: CreateEventPadding.selectCategoryMargin,
      padding: CreateEventPadding.selectCategoryPadding,
      decoration: BoxDecoration(
        borderRadius: CreateEventRadius.createEventSelectCategory,
        border: Border.all(width: 1, color: ThemePurple.blackColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(items[selectValue].toString(), 20, ThemePurple.blackColor),
          SizedBox(
            height: 50,
            width: 200,
            child: CupertinoButton.filled(
                child:const  SizedBox(
                    //height: 150,
                    // color: Colors.black,
                    width: 250,
                    child: Text(
                      CreateEventStrings.selectCategory,
                      style: TextStyle(fontSize: CreateEventsSize.sizedBox),
                    )),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            actions: [buildPicker(items)],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text(CreateEventStrings.cancel),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ));
                }),
          ),
        ],
      ),
    );
  }

  SizedBox buildPicker(List list) {
    return SizedBox(
      height: 250,
      child: CupertinoPicker(
        itemExtent: 60,
        looping: true,
        onSelectedItemChanged: (int value) {
          setState(() {
            selectValue = value;
          });
        },
        children: list
            .map((e) => Center(
                    child: Text(
                  e,
                  style: const TextStyle(
                      color: ThemePurple.blackColor,
                      fontSize: CreateEventsSize.buildPickerSize),
                )))
            .toList(),
      ),
    );
  }
}
