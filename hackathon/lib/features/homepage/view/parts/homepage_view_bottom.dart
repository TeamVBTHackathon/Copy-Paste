part of home_page_view;



class EventCardWidget extends StatelessWidget {
   EventCardWidget({
    Key? key,
    required this.foundEvent,
  }) : super(key: key);

  EventModel  foundEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomePadding.homeBottomListViewPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            height: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(foundEvent.name.toString()),
               // Text(_eventMonth),
              ],
            ),
          ),
          Padding(
            padding: HomePadding.homeBottomEventInformationPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1.4 km",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: HomePadding.homeBottomEventNamePadding,
                  child: Text(
    foundEvent.name.toString(),
    style: Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontSize: HomePageSize.homeBottomEventName),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
    HomePageIcon.homeBottomLocationIcon,
    Text(foundEvent.location.toString())
                  ],
                ),
                SizedBox(
                  width: context.highWidthValue * 2,
                  child: ElevatedButton(
    onPressed: () {},
    child: Text("view event"),
    style: ElevatedButton.styleFrom(
      primary: ThemePurple.darkPurple,
      textStyle: Theme.of(context).textTheme.button!.copyWith(
            color: ThemePurple.whiteColor,
          ),
    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }