library profile_view;

import 'package:flutter/material.dart';
import 'package:hackathon/core/core/model/event_model.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';
import 'package:hackathon/features/createEvent/create_event.dart';
import 'package:hackathon/features/eventDetail/view/event_detail_view.dart';
import 'package:hackathon/features/homepage/eventdata/eventdata.dart';
import 'package:hackathon/features/widgets/custom_appbar.dart';

import '../../../core/constants/icon/profilepage_icon_constants.dart';
import '../../../core/constants/radius/profile_page_radius.dart';
import '../../../core/constants/strings/profile_strings.dart';
import '../widgets/listview.dart';

part 'parts/scroll_row_content.dart';
part 'parts/createeventcontent.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Color _iconColor = ThemePurple.darkPurple;
    return Scaffold(
      appBar: const CustomAppbar(
        headline: ProfileStrings.headline,
        isBackButton: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: context.height,
          child: Column(
            children: [
              const ScrollRowWidget(),
              const CreateEventWidget(),
              TabBar(
                indicatorColor: ThemePurple.darkPurple,
                labelColor: ThemePurple.darkPurple,
                unselectedLabelColor: ThemePurple.blackOpacityColor,
                controller: _controller,
                tabs: const [
                  Tab(
                    text: ProfileStrings.allEvents,
                  ),
                  Tab(
                    text: ProfileStrings.savedEvent,
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.5,
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    ListViewWidget(iconColor: _iconColor),
                    ListViewWidget(iconColor: _iconColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
