
library create_event.dart;

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme.dart';
import 'package:hackathon/features/createEvent/globalmethods/globalemethods.dart';
import 'package:image_picker/image_picker.dart';


part 'parts/submitbutton.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);



  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  
 List icon=[Icons.camera_alt,Icons.image,Icons.remove_circle];
 List iconText = ["Camera","Gallery","Remove"];

  final _formKey = GlobalKey<FormState>();
 int selectValue = 0;
  List items=["Bussiness","Public Fun","Meet"];
  var productTitle = '';
  


  var productDescription = '';

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();




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
                          height: context.height*7/10,
                          child: Column(
                            children: [
                             
                              

                              //select Photo
                              _imageBox(context),

                              //select Event Title

                              Container(
                               margin: EdgeInsets.only(top: 40),
                               child: Column(

                                 children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:Alignment.centerLeft,child:  MyText("Event Title", 20, Colors.black),),
                                   Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextFormField(

                                       // key: ValueKey(valKey),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Please enter a title';
                                          }
                                          return null;
                                        },
                                        
                                        controller: _titleController,
                                       
                                        keyboardType:TextInputType.text,
                                        maxLines: 1,
                                      
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(20.0),
                                          hintText: 'Example Company',
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 1)),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.primaryColor,width: 1))
                                        ),
                                        onSaved: (val) {
                                          productTitle = val!;
                                        },
                                      )
                                    
                                    
                                   
                            ),
                                 ],
                               ),
                             ),
                            
                               eventTitleContent(),

                            
                                descriptionContent(),

                                selectCategory(context),

   
                              
                            ],
                          ),
                        ),
                         Container(
                           //color: Colors.black,
                             height: context.height*1/11,
                           child: SubmitButton())
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

  TextFormField descriptionContent() {
    return _textFormField(
                                onSaved: productDescription,
                                valKey: 'Description',
                                valText: 'Product description is required',
                                hintText: 'Description',
                                line: 5,
                               
                              );
  }

  Container eventTitleContent() {
    return Container(
                               margin: EdgeInsets.only(top: 40),
                               child: Column(

                                 children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      alignment:Alignment.centerLeft,child:  MyText("Event Title", 20, Colors.black),),
                                   Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextFormField(

                                       // key: ValueKey(valKey),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Please enter a title';
                                          }
                                          return null;
                                        },
                                        
                                        controller: _titleController,
                                       
                                        keyboardType:TextInputType.text,
                                        maxLines: 1,
                                      
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(20.0),
                                          hintText: 'Example Company',
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 1)),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.primaryColor,width: 1))
                                        ),
                                        onSaved: (val) {
                                          productTitle = val!.toString();
                                        },
                                      )
                                    
                                    
                                   
                            ),
                                 ],
                               ),
                             );
  }

  Container selectCategory(BuildContext context) {
    return Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(items[selectValue]),

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
                                          actions: [buildPicker()],
                                          cancelButton: CupertinoActionSheetAction(child: Text("Cancel"),
                                          onPressed: ()=>Navigator.pop(context),),
                                        ));
                                     }),
                                ),
                            
                                  ],
                                ),
                              );
  }

  Widget buildPicker()=> SizedBox(
                height: 250,
                  child: CupertinoPicker(
                  itemExtent: 60,
                  looping: true,
                  onSelectedItemChanged: (int value) { 
                    setState(() {
                      selectValue=value;
                    });
                   },
                  children: items.map((e) => Center(child: MyText(e, 20, Colors.black))).toList(),),
                  );

  Row _imageBox(BuildContext context) {
    return Row(
                        children: [
                          Expanded(
                            child: image== null
                                ? Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Image.file(
                                      image!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                          ),
                          Container(
                            height: 200,
                            //color:Colors.red,
                            child: Column(
                             
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //selecting event photo
                                for(var i =0;i<3;i++)

                                InkWell(
                                  onTap: ()=>i==0?_getCameraImage():i==1?_getGalleryImage():_removeImage(),
                                  child: Container(
                                    width: context.width/4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(icon[i]),
                                      Text(iconText[i])
                                    ],
                                  ),),
                                ),
                               
                              ],
                            ),
                          ),
                        ],
                      );
  }

  TextFormField _textFormField({
    required String onSaved,
    required String valKey,
    required String valText,
    required String hintText,
    String? onChanged,
    TextInputType? textInputType,
    List<TextInputFormatter>? filteringTextInput,
    TextEditingController? controller,
    
    int? line,
  }) {
    return TextFormField(

      key: ValueKey(valKey),
      validator: (val) {
        if (val!.isEmpty) {
          return valText;
        }
        return null;
      },
      
      controller: controller,
      inputFormatters: filteringTextInput,
      keyboardType: textInputType ?? TextInputType.text,
      maxLines: line ?? 1,
    
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20.0),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 1)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: theme.primaryColor,width: 1))
      ),
      onSaved: (val) {
        onSaved = val!.toString();
      },
    );
  }

   void _trySubmit() async {
    final _isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_isValid) {
      _formKey.currentState!.save();
    }
  }

  Future _getCameraImage() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(image2!.path);
    });
  }

  Future _getGalleryImage() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(image2!.path);
    });
  }

  void _removeImage() {
    setState(() {
      image = null;
    });
  }

  void listeyeYasEkle(){
    for(var i =14;i<5;i++)
      {
        items.add(i);
      }
      
    
    }

    List<DropdownMenuItem<String>> categoryItems = [
                                DropdownMenuItem(
                                  
                                  child: Container(

                                    height: 50,
                                    width: 300,
                                    child: Text('Bussines')),
                                  value: 'Bussines',
                                ),
                                DropdownMenuItem(
                                  child: Container(
                                    height: 50,
                                    width: 300,
                                    child: Text('workplace')),
                                  value: 'workplace',
                                ),
                               
                                
                              ];
   
}



MyText(String text,double size,Color color,){
  
  return Text(text,style: TextStyle(fontSize: size,color: color,));
}


