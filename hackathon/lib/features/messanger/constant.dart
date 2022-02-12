
import 'package:flutter/material.dart';

const String username = "Sela Monysathya";
const String position = "Mobile Developer";
const String profileUrl = "https://lh3.googleusercontent.com/a-/AOh14Ggibf7DAm7F_DwTM4czKKWEI8a7T--IvdzFanUO=s600-k-no-rp-mo";

getBorderRadiusMessage(messageNo, isMe) {
  if(isMe) {
    if(messageNo == 1) {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(5)
      );
    } else if(messageNo == 2) {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5)
      );
    } else if(messageNo == 3) {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(10)
      );
    } else {
      return BorderRadius.circular(10);
    }
  } else {
    if(messageNo == 1) {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(5),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10)
      );
    } else if(messageNo == 2) {
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10)
      );
    } else if(messageNo == 3) {
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10)
      );
    } else {
      return BorderRadius.circular(10);
    }
  }
} 