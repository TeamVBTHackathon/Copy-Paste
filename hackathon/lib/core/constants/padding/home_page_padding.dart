import 'package:flutter/cupertino.dart';

class HomePadding {
  //! Home Page İlk Container
  static const EdgeInsetsGeometry homeMainTitlePadding = EdgeInsets.all(16);
  static const EdgeInsetsGeometry homeMainTitleColumnPadding =
      EdgeInsets.symmetric(vertical: 16, horizontal: 0);
  static const EdgeInsetsGeometry homeSubTitlePadding = EdgeInsets.symmetric(
    vertical: 40,
  );

  static const EdgeInsetsGeometry homeCategoryMainPadding =
      EdgeInsets.only(top: 10, bottom: 10);
  static const EdgeInsetsGeometry homeCategoryTextPadding =
      EdgeInsets.symmetric(vertical: 6);

  static const EdgeInsetsGeometry homeCategoryListPadding =
      EdgeInsets.symmetric(
    horizontal: 16,
  );

  //! Home Page ikinci Container
  static const EdgeInsetsGeometry homeBottomListViewPadding =
      EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsetsGeometry homeBottomContainerPadding =
      EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry homeBottomEventInformationPadding =
      EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsetsGeometry homeBottomEventNamePadding =
      EdgeInsets.only(top: 8, bottom: 8);
}
