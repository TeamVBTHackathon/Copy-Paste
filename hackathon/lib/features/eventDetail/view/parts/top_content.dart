part of event_detail_view;

class TopContentWidget extends StatelessWidget {
  final String _title;
  final String _host;
  const TopContentWidget(this._title, this._host, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // bottom layer
        Container(
          padding: EventDetailPadding.topContentContainer,
          height: context.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(
              // color: redTheme.primaryColor,
              borderRadius: EventDetailRadius.topContentStackRadius,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(EventDetailStrings.topContentImagePath))),
        ),

        // middle layer
        Container(
            padding: EventDetailPadding.eventDetailTopContentContainer,
            height: context.height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThemePurple.blackColor.withOpacity(0.3),
              borderRadius: EventDetailRadius.topContentStackRadius,
            )),

        //  top Layer
        Container(
          padding: EventDetailPadding.eventDetailTopContentContainerPadding,
          height: context.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: redTheme.primaryColor,
            borderRadius: EventDetailRadius.topContentStackRadius,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: context.width,
                //color: Colors.black,
                padding: EventDetailPadding.eventDetailTopContentColumn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        //color: Colors.orange,
                        width: context.width * 2 / 4,
                        margin: EventDetailPadding.eventDetailMargin1,
                        child: Text(
                          _title,
                          style: headerStyle,
                        )),
                    Container(
                        margin: EventDetailPadding.eventDetailMargin2,
                        child: EventDetailIcon.eventDetailEventIcon)
                  ],
                ),
              ),
              Row(
                children: [
                  EventDetailIcon.eventDetailAnnounIcon,
                  Text(
                    "Hosted by $_host",
                    style: hostTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
