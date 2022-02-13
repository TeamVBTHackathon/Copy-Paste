part of event_detail_view;

class JoinButtonWidget extends StatelessWidget {
  const JoinButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EventDetailPadding.joinButtonPadding,
        width: double.infinity,
        height: context.height / 15,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: EventDetailRadius.joinButtonRadius,
              ),
            ),
            child: const Text(EventDetailStrings.joinButtonText)));
  }
}
