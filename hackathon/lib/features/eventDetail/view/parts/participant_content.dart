part of event_detail_view;

class ParticipantContentWidget extends StatelessWidget {
  const ParticipantContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: context.width * 2.1 / 5,
            height: context.height / 23,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const CircleAvatar(
                    backgroundColor: Colors.grey,
                  );
                })),
        const Text(
          " +15 participants",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
