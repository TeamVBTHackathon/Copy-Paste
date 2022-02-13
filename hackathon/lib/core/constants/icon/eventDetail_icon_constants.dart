import 'package:flutter/material.dart';

import '../../init/theme/theme_purple.dart';

class EventDetailIcon {
  static const Icon searchIcon = Icon(
    Icons.arrow_back,
    color: ThemePurple.blackColor,
    size: 35,
  );
  static const Icon eventDetailEventIcon = Icon(
    Icons.event,
    size: 30,
    color: Colors.orange,
  );
  static const Icon eventDetailAnnounIcon = Icon(
    Icons.announcement,
    color: Colors.yellow,
    size: 25,
  );
  static const Icon dateRange = Icon(Icons.date_range);
  static const Icon schedule = Icon(Icons.schedule);
  static const Icon videoCall = Icon(Icons.video_call);
}
