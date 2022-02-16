import 'package:flutter/material.dart';

const String username = "Sela Monysathya";
const String position = "Mobile Developer";
const String profileUrl =
    "https://lh3.googleusercontent.com/a-/AOh14Ggibf7DAm7F_DwTM4czKKWEI8a7T--IvdzFanUO=s600-k-no-rp-mo";

BorderRadius getBorderRadiusMessage(int messageNo, bool isMe) {
  if (isMe) {
    switch (messageNo) {
      case 1:
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(5),
        );
      case 2:
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        );
      case 3:
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(10),
        );

      default:
        return BorderRadius.circular(10);
    }
  }

  switch (messageNo) {
    case 1:
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(5),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );

    case 2:
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    case 3:
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    default:
      return BorderRadius.circular(10);
  }
}
