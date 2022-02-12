
library create_event.dart;



import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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



  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  


  final _formKey = GlobalKey<FormState>();
 int selectValue = 0;
  List items=["Bussiness","Public Fun","Meet"];
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
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60,left: 10,right: 10),
                    child: Column(
                      children: [
                        Container(
                         //color: Colors.amber,
                          //height: context.height*7.5/10,
                          child: Column(
                            children: [

                              //select Photo
                             AddImageContainer(image),

                              //select Event Title
                              EventTitleContent(titleController: _titleController),
                            
                              // add event description
                               EventDescriptionContent(descriptionController:_descriptionController,),

                              //select event Category
                                selectCategory(),
                            ],
                          ),
                        ),
                         Container(
                           //color: Colors.black,
                             height: context.height*1/11,
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

    Container selectCategory() {
    return Container(
                                margin: EdgeInsets.only(top: 20,left: 10),
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1,color: Colors.black),),
                               
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(items[selectValue].toString(), 20, Colors.black),

                                Container(
                                  height: 50,
                                  width: 200,
                                  child: CupertinoButton.filled(
                                   
                                    child: Container(
                                      //height: 150,
                                     // color: Colors.black,
                                      width: 250,
                                      child: Text("Select Category",style: TextStyle(fontSize: 10),)),
                                     onPressed: (){
                                       showCupertinoModalPopup(context: context,
                                        builder: (context)=>CupertinoActionSheet(
                                          actions: [BuildPickerOfCategory()],
                                          cancelButton: CupertinoActionSheetAction(child: Text("Cancel"),
                                          onPressed: ()=>Navigator.pop(context),),
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
                                    selectValue=value;
                                  });
                                },
                                children: items.map((e) => Center(child: Text(e,style: TextStyle(color: Colors.black,fontSize: 20),))).toList(),),
                                );
    }
}






