// ignore_for_file: must_be_immutable, unused_local_variable

part of category_event_view;

class HomePageBody extends StatefulWidget {
  final String _name;

  const HomePageBody(this._name, {Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late String categoryTitle;

  @override
  void initState() {
    super.initState();
    categoryTitle = widget._name;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        color: ThemePurple.darkPurple,
        child: Column(
          children: [
            const CustomAppbar(headline: "Kategoriler", isBackButton: true),
            Container(
              padding: const EdgeInsets.only(top: 50),
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
                      categoryTitle,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: HomePageSize.homeBottomYakinEtkinlikSize,
                          ),
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("events")
                            .where("category", isEqualTo: "teknik")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    QueryDocumentSnapshot satirverisi =
                                        snapshot.data!.docs[index];
                                    //print("satır datası"+satirverisi.data().toString());
                                    return CategoriesEventCardWidget(
                                      foundEvent: events[index],
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const Text("hata");
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container header(context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
