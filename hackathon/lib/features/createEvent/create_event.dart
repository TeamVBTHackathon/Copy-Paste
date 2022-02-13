library create_event.dart;

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/core/service/firestore_methods.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme.dart';
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
  List items = ["Sosyal Sorumluluk"];
  var productTitle = '';
  File? _image;

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  GlobalMethods _globalMethods = GlobalMethods();

  File? image;

  Future<void> getCategories() async {
    await FirebaseFirestore.instance
        .collection('categroies')
        .get()
        .then((value) {
      setState(() {
        items = value.docs.map((e) => e.data()['name']).toList();
        print(items);
      });
    });
  }

  @override
  void initState() {
    getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.amber,
                          //height: context.height*7.5/10,
                          child: Column(
                            children: [
                              //select Photo
                              AddImageContainer(_image),

                              //select Event Title
                              EventTitleContent(
                                  titleController: titleController),

                              // add event description
                              EventDescriptionContent(
                                descriptionController: descriptionController,
                              ),

                              //select event Category
                              selectCategory(),
                            ],
                          ),
                        ),
                        SizedBox(
                          //color: Colors.black,
                          height: context.height * 1 / 11,
                          child: SubmitButton(
                            formKey: _formKey,
                            categoryController: categoryController,
                            titleController: titleController,
                            descriptionController: descriptionController,
                          ),
                        ),
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

  Container selectCategory() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(items[selectValue].toString(), 20, Colors.black),
          SizedBox(
            height: 50,
            width: 200,
            child: CupertinoButton.filled(
                child: const SizedBox(
                    //height: 150,
                    // color: Colors.black,
                    width: 250,
                    child: Text(
                      "Select Category",
                      style: TextStyle(fontSize: 10),
                    )),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            actions: [BuildPickerOfCategory()],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text("Ok"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ));
                }),
          ),
        ],
      ),
    );
  }

  SizedBox BuildPickerOfCategory() {
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
        children: items
            .map((e) => Center(
                    child: Text(
                  e,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )))
            .toList(),
      ),
    );
  }
}
