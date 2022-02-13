part of event_detail_view;

class JoinButtonWidget extends StatelessWidget {
  const JoinButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: context.height / 15,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text("Join")));
  }
}
