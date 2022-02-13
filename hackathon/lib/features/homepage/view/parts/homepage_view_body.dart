part of home_page_view;

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  
  
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}
    List<EventModel> events=[
        EventModel(id: "1", name: "event1", description: "description", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "2", name: "fevent2", description: "description1", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "3", name: "devent3", description: "description2", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "4", name: "cevent4", description: "description3", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "5", name: "gevent5", description: "descriptio4", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "6", name: "gevent6", description: "description5", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "7", name: "cevent6", description: "description6", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),
        EventModel(id: "8", name: "fevent7", description: "description7", image: "", location: "Antalya", date: "07.11.2022", time: "11:40 am", category: "Publi Meet"),

      ];
class _HomePageBodyState extends State<HomePageBody> {
  //List allEvents=[];
   late List foundEvents;
  //EventService _eventService =EventService();
  

    
  
  @override
  void initState(){
   
    super.initState();
      //atama();
       
      _runFilter("");
      

 
      //print("Uzunluk"+datalar.length.toString());
    //_runFilter("");
  }
  // void atama()async{
  //   allEvents= await _eventService.getir();
  // }

  @override
  Widget build(BuildContext context) {
    //print("sssssssssss " +allEvents.length.toString());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        color: ThemePurple.darkPurple,
        child: Column(
          children: [
            _buildHomeEventsContainer(),
            _buildHomeCategory(),


             Container(
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
          color: ThemePurple.whiteColor,
          borderRadius: HomePageRadius.homeBottomContainer),
      child: Padding(
        padding: HomePadding.homeBottomContainerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    Text(
              HomePageString.yakinEtkinlikler,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: HomePageSize.homeBottomYakinEtkinlikSize,
                  ),
            ),
            

              Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                   itemCount: foundEvents.length,
                  itemBuilder: (context,index) {

                    //search list başlangıç
                    return EventCardWidget(foundEvent:foundEvents[index]);
                  },
                 
                ),
              ],
            ),
            
          ],
        ),
      ),
    )
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCategory() {
  
      return Padding(
      padding: HomePadding.homeCategoryMainPadding,
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (context, index) {
            return Padding(
              padding: HomePadding.homeCategoryListPadding,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: ThemePurple.whiteColor,
                    radius: HomePageRadius.circleAvatarRadius,
                    child: IconButton(
                        onPressed: () {}, icon: HomePageIcon.homePaletIcon),
                  ),
                  Padding(
                    padding: HomePadding.homeCategoryTextPadding,
                    child: Text(
                      "category",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: ThemePurple.whiteColor),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
   
  }

  Widget _buildHomeEventsContainer() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ThemePurple.lightPurple, ThemePurple.darkPurple],
        ),
      ),
      child: Padding(
        padding: HomePadding.homeMainTitlePadding,
        child: _buildHomePageTexts(),
      ),
    );
  }

  Widget _buildHomePageTexts() {
    return Column(
      children: [
        Padding(
          padding: HomePadding.homeMainTitleColumnPadding,
          child: Column(
            children: [
              Text(
                HomePageString.title,
                style: const TextStyle(
                    fontSize: HomePageSize.titleSize,
                    fontWeight: FontWeight.bold,
                    color: ThemePurple.whiteColor),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: HomePadding.homeSubTitlePadding,
                child: Row(
                  children: [
                    const Icon(HomePageIcon.locationIcon,
                        color: ThemePurple.whiteColor),
                    Text(
                      HomePageString.subtitle,
                      style: const TextStyle(
                          fontSize: HomePageSize.subTitleSize,
                          color: ThemePurple.whiteColor),
                    ),
                  ],
                ),
              ),
              _buildHomeSearchInput(),
            ],
          ),
        ),
      ],
    );
  }
  

  Widget _buildHomeSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: ThemePurple.whiteColor,
        borderRadius: HomePageRadius.homeSearchBarRadius,
      ),
      child: Form(
        child: TextFormField(
          onChanged: (value) => _runFilter(value),
          cursorColor: ThemePurple.whiteColor,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ThemePurple.transparentColor),
            ),
            hoverColor: ThemePurple.transparentColor,
            labelText: HomePageString.searchBar,
            prefixIcon: HomePageIcon.searchIcon,
          ),
        ),
      ),
    );
  }
  
  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = events;
    } else {
      results = events
          .where((place) =>
          place.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive

      print(results);
    }

    // Refresh the UI
    setState(() {
      
      foundEvents = results;
    });
  }
}

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
