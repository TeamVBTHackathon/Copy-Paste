import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/features/landing/service/global_methods.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({Key? key}) : super(key: key);
  static const routeName = 'upload-product-screen';
  @override
  _UploadProductScreenState createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _trySubmit,
          child: const Text(
            'S U B M i T',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
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
}
