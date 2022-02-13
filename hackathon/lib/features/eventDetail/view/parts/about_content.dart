// ignore_for_file: use_key_in_widget_constructors

part of event_detail_view;

class AboutContentWidget extends StatelessWidget {
  final String _aboutText;
  const AboutContentWidget(this._aboutText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "About this event",
                style: TextThemeLight.instance!.headline5,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CommentsScreen(
                                  postId: "1",
                                )));
                  },
                  icon: Icon(
                    Icons.comment,
                    color: theme.primaryColor,
                  ))
            ],
          ),
          Container(
              padding: const EdgeInsets.only(right: 10, bottom: 20),
              child: Text(_aboutText, style: aboutStyle)),
        ],
      ),
    );
  }
}
