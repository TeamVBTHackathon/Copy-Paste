import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String headline;
  final bool isBackButton;
  const CustomAppbar(
      {Key? key, required this.headline, required this.isBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
          leading: isBackButton
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null,
          centerTitle: true,
          backgroundColor: ThemePurple.transparentColor,
          elevation: 0.0,
          title: Text(
            headline,
            style: const TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          )
          // IconButton(
          //     icon: Icon(
          //       favorite == false ? Icons.favorite_outline : Icons.favorite,
          //       color: theme.primaryColor,
          //       size: 35,
          //     ),
          //     onPressed: () => setState(() {
          //           favorite = !favorite;
          //         })),

          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
