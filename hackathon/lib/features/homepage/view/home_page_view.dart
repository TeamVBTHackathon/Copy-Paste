library home_page_view;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/core/constants/Size/home_page_size_constants.dart';
import 'package:hackathon/core/constants/icon/homepage_icon_constants.dart';
import 'package:hackathon/core/constants/padding/home_page_padding.dart';
import 'package:hackathon/core/constants/radius/home_page_radius.dart';
import 'package:hackathon/core/constants/strings/homepage_strings.dart';
import 'package:hackathon/core/core/model/event_model.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/categoriesDetail/category_event._view.dart';
import 'package:hackathon/features/eventDetail/view/event_detail_view.dart';
import 'package:hackathon/features/homepage/eventdata/eventdata.dart';

part 'parts/homepage_view_body.dart';
part 'parts/homepage_view_bottom.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomePageBody(),
      ),
    );
  }
}
