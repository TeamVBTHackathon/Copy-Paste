
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
  final _formKey = GlobalKey<FormState>();
 int selectValue = 14;
  List items=[];
  var _productTitle = '';
  var _productPrice = '';
  var _productCategory = '';
  var _productBrand = '';
  var _productDescription = '';
  var _productQuantity = '';

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();

  String? _categoryValue;
  String? _brandValue;

  GlobalMethods _globalMethods = GlobalMethods();

  File? _image;

  _showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      listeyeYasEkle();
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: _textFormField(
                                onSaved: _productTitle,
                                valKey: 'title',
                                valText: 'Please enter a title',
                                labelText: 'Title',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: _textFormField(
                                onSaved: _productPrice,
                                valKey: 'price',
                                valText: 'Please enter a title',
                                labelText: 'Price',
                                textInputType: TextInputType.number,
                                filteringTextInput: [
                                  FilteringTextInputFormatter.allow(RegExp('r[0-9]')),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _image == null
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
                                        _image!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                            ),
                            Column(
                              children: [
                                TextButton.icon(
                                  onPressed: _getCameraImage,
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text('Camera'),
                                ),
                                TextButton.icon(
                                  onPressed: _getGalleryImage,
                                  icon: const Icon(Icons.image),
                                  label: const Text('Gallery'),
                                ),
                                TextButton.icon(
                                  onPressed: _removeImage,
                                  icon: const Icon(Icons.remove_circle),
                                  label: const Text('Remove'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _textFormField(
                                  onSaved: _productCategory,
                                  valKey: 'category',
                                  valText: 'Please enter a category',
                                  labelText: 'Category',
                                  controller: _categoryController,
                                  onlyRead: true),
                            ),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  child: Text('Phones'),
                                  value: 'Phones',
                                ),
                                DropdownMenuItem(
                                  child: Text('Cloathes'),
                                  value: 'Cloathes',
                                ),
                                DropdownMenuItem(
                                  child: Text('Beauty & Health'),
                                  value: 'Beauty',
                                ),
                                DropdownMenuItem(
                                  child: Text('Shoes'),
                                  value: 'Shoes',
                                ),
                                DropdownMenuItem(
                                  child: Text('Furnitures'),
                                  value: 'Furnitures',
                                ),
                                DropdownMenuItem(
                                  child: Text('Watches'),
                                  value: 'Watches',
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _categoryValue = value.toString();
                                  _categoryController.text = value.toString();
                                });
                              },
                              hint: const Text('Select a Category'),
                              value: _categoryValue,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: Container(
                                    child: _textFormField(
                                  onSaved: _productBrand,
                                  valKey: 'Brand',
                                  valText: 'Brand is Missed',
                                  labelText: 'Brand',
                                  controller: _brandController,
                                  onlyRead: true,
                                )),
                              ),
                            ),
                            DropdownButton<String>(
                              items: const [
                                DropdownMenuItem<String>(
                                  child: Text('Brandless'),
                                  value: 'Brandless',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Addidas'),
                                  value: 'Addidas',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Apple'),
                                  value: 'Apple',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Dell'),
                                  value: 'Dell',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('H&M'),
                                  value: 'H&M',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Nike'),
                                  value: 'Nike',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Samsung'),
                                  value: 'Samsung',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Huawei'),
                                  value: 'Huawei',
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _brandValue = value.toString();
                                  _brandController.text = value.toString();
                                });
                              },
                              hint: const Text('Select a Brand'),
                              value: _brandValue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        _textFormField(
                          onSaved: _productDescription,
                          valKey: 'Dexcription',
                          valText: 'Product description is required',
                          labelText: 'Description',
                          line: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
            
            height: MediaQuery.of(context).size.height*1.95/3,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Container(
                  
                  margin: EdgeInsets.only(bottom: 40),
                  child: MyText("How old are you?",20,Colors.black)),

                  SizedBox(height: 250,
                  child: CupertinoPicker(itemExtent: 60,
                  //looping: true,
                  onSelectedItemChanged: (int value) { 
                    setState(() {
                      selectValue=value+14;
                    });
                   },
                  children: items.map((e) => Center(child: MyText(e.toString(), 30, Colors.black))).toList(),),
                  )

              
      
              ],
            )),
              SubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textFormField({
    required String onSaved,
    required String valKey,
    required String valText,
    required String labelText,
    TextInputType? textInputType,
    List<TextInputFormatter>? filteringTextInput,
    TextEditingController? controller,
    bool? onlyRead,
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
      readOnly: onlyRead ?? false,
      controller: controller,
      inputFormatters: filteringTextInput,
      keyboardType: textInputType ?? TextInputType.text,
      maxLines: line ?? 1,
      decoration: InputDecoration(
        labelText: labelText,
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
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future _getGalleryImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  void listeyeYasEkle(){
    for(var i =14;i<5;i++)
      {
        items.add(i);
      }
      
    
    }
}



MyText(String text,double size,Color color,){
  
  return Text(text,style: TextStyle(fontSize: size,color: color,));
}