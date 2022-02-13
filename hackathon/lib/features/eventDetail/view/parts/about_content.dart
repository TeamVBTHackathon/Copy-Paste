part of event_detail_view;

class AboutContentWidget extends StatelessWidget {
  final String _aboutText;
  const AboutContentWidget(this._aboutText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EventDetailPadding.aboutContentPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                EventDetailStrings.aboutThis,
                style: TextThemeLight.instance!.headline5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment,
                    color: theme.primaryColor,
                  ))
            ],
          ),
          Container(
              padding: EventDetailPadding.aboutContentContainerPadding,
              child: Text(_aboutText, style: aboutStyle)),
        ],
      ),
    );
  }
}
