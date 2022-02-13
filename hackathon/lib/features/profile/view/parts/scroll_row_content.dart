part of profile_view;

class ScrollRowWidget extends StatelessWidget {
  const ScrollRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EventModel> list = events;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < list.length; i++)
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, EventDetailView.routeName);
                  },
                  child: Container(
                    margin: context.paddingWithLowNormal,
                    height: context.height * 0.23,
                    width: context.widthValue,
                    decoration: BoxDecoration(
                      color: ThemePurple.whiteColor,
                      borderRadius: ProfilePageRadius.generalRadius,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 15,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 8.0,
                            margin: context.noPadding,
                            shape: RoundedRectangleBorder(
                              borderRadius: ProfilePageRadius.generalRadius,
                            ),
                            child: Image.network(
                              list[i].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: context.paddingWithLowNormal,
                            child: Center(
                              child: Text(
                                list[i].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: ThemePurple.blackColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
