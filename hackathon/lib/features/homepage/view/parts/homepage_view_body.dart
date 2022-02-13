part of home_page_view;

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        color: ThemePurple.darkPurple,
        child: Column(
          children: [
            _buildHomeEventsContainer(),
            _buildHomeCategory(),
            const HomePageBottom(),
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
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('categroies').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                child: categories(
                  context,
                  snap: snapshot.data!.docs[index].data(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//categories(context)
  Padding categories(BuildContext context, {dynamic snap}) {
    return Padding(
      padding: HomePadding.homeCategoryListPadding,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ThemePurple.whiteColor,
            radius: HomePageRadius.circleAvatarRadius,
            child:
                IconButton(onPressed: () {}, icon: HomePageIcon.homePaletIcon),
          ),
          Padding(
            padding: HomePadding.homeCategoryTextPadding,
            child: Text(
              snap['name'],
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: ThemePurple.whiteColor),
            ),
          )
        ],
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
}
