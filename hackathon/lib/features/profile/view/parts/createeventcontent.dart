part of profile_view;

class CreateEventWidget extends StatelessWidget {
  const CreateEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: context.paddingWithLowNormal,
          padding: context.paddingWithLowMedium,
          height: context.widthValue,
          width: context.width,
          decoration: BoxDecoration(
            color: ThemePurple.darkPurple,
            borderRadius: ProfilePageRadius.generalRadius,
          ),
          child: Row(
            children: [
              SizedBox(
                height: context.hightValue / 3.5,
                width: context.widthValue,
                child: const Card(child: ProfilePageIcon.personIcon),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text(
                    ProfileStrings.newEvent,
                    style: TextStyle(
                        color: ThemePurple.yellowColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    ProfileStrings.organizeEvent,
                    style: TextStyle(
                        color: ThemePurple.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10.0,
          top: context.hightValue / 7,
          child: IconButton(onPressed: () {}, icon: ProfilePageIcon.arrowIcon),
        )
      ],
    );
  }
}
