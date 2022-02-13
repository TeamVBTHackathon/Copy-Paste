import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String headline;
  const CustomAppbar({Key? key, required this.headline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: ThemePurple.transparentColor,
        elevation: 0.0,
        title: Text(
          headline,
          style: const TextStyle(color: ThemePurple.blackColor),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
