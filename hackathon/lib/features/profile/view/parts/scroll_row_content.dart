part of profile_view;

class ScrollRowWidget extends StatelessWidget {
  const ScrollRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String randomImage = 'https://picsum.photos/200/300';
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 8; i++) //cekilen etkinlik sayisi kadar donecek
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, EventDetailView.routeName);
                  },
                  child: Container(
                    margin: context.paddingWithLowNormal,
                    height: context.hightValue,
                    width: context.widthValue,
                    decoration: BoxDecoration(
                      color: ThemePurple.whiteColor,
                      borderRadius: ProfilePageRadius.generalRadius,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 8.0,
                            margin: context.noPadding,
                            shape: RoundedRectangleBorder(
                              borderRadius: ProfilePageRadius.generalRadius,
                            ),
                            child: Image.network(
                              randomImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: context.paddingWithLowNormal,
                            child: Center(
                              child: Text(
                                ProfileStrings.eventName,
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
