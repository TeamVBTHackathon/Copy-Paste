import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/padding/create_event_padding.dart';
import 'package:hackathon/core/init/theme/theme.dart';

TextFormField textFormField({
  required String onSaved,
  required String valKey,
  required String valText,
  required String hintText,
  String? onChanged,
  TextInputType? textInputType,
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
    keyboardType: textInputType ?? TextInputType.text,
    maxLines: line ?? 1,
    decoration: InputDecoration(
        contentPadding: CreateEventPadding.textFormFieldPadding,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor, width: 1))),
    onSaved: (val) {
      onSaved = val!.toString();
    },
  );
}
