part of 'main_screen.dart';

class MainScreenBottom extends StatelessWidget {
  const MainScreenBottom({Key? key}) : super(key: key);

  final String _eventDay = "21";
  final String _eventMonth = "MAR";
  final String _eventDistance = "1.4 KM AWAY";
  final String _eventName = "Local Hero";
  final String _eventLocation = "South Statue Art Center";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nearest Events",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                  ),
            ),
            Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 125,
                            height: 125,
                            color: Colors.pink,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_eventDay),
                                Text(_eventMonth),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_eventDistance),
                                Text(
                                  _eventName,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_rounded),
                                    Text(_eventLocation)
                                  ],
                                ),
                                Container(
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("View Event"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.purple,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(
                                            color: Colors.white,
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
                  },
                  itemCount: 6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
