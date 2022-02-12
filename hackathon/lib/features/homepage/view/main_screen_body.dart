part of 'main_screen.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemePurple().theme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        color: theme.primaryColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.pink.shade300, Colors.purple],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(context.height * 0.02),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.height * 0.02, horizontal: 0),
                      child: Column(
                        children: [
                          Text(
                            HomePageString.title,
                            style: theme.textTheme.headline1!
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 40,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.white),
                                Text(
                                  HomePageString.subtitle,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Form(
                              child: TextFormField(
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  hoverColor: Colors.transparent,
                                  labelText: HomePageString.searchBar,
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.palette,
                                color: Colors.pink.shade300,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              // TODO : dynamic
                              "Category ",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const MainScreenBottom(),
          ],
        ),
      ),
    );
  }
}
