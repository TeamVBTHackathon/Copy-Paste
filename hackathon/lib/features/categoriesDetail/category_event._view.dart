library category_event_view;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/Size/home_page_size_constants.dart';
import 'package:hackathon/core/constants/padding/home_page_padding.dart';
import 'package:hackathon/core/constants/radius/home_page_radius.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/categoriesDetail/widget/event_widget.dart';
import 'package:hackathon/features/homepage/eventdata/eventdata.dart';
import 'package:hackathon/features/widgets/custom_appbar.dart';
part './view/parts/categoryevent_view_body.dart';

class CategoryEventView extends StatefulWidget {
  final String name;
  const CategoryEventView({required this.name, Key? key}) : super(key: key);

  static const routeName = '/category-event';

  @override
  _CategoryEventViewState createState() => _CategoryEventViewState();
}

class _CategoryEventViewState extends State<CategoryEventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(widget.name),
    );
  }
}
