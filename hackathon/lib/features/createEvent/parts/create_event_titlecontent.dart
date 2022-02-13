part of create_event.dart;

class EventTitleContent extends StatelessWidget {
  const EventTitleContent({
    Key? key,
    required TextEditingController titleController,
  })  : _titleController = titleController,
        super(key: key);

  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: CreateEventPadding.titleContentContainerMargin,
      child: Column(
        children: [
          Container(
            padding: CreateEventPadding.titleContentContainer,
            alignment: Alignment.centerLeft,
            child: MyText(
                CreateEventStrings.eventTitle, 20, ThemePurple.blackColor),
          ),
          Container(
              margin: CreateEventPadding.titleContentContainerPadding,
              child: _buildTextFormField()),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      // key: ValueKey(valKey),
      validator: (val) {
        if (val!.isEmpty) {
          return CreateEventStrings.title;
        }
        return null;
      },

      controller: _titleController,
      keyboardType: TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: CreateEventPadding.titleContentInput,
          hintText: CreateEventStrings.exampleCompany,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemePurple.greyColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.primaryColor, width: 1))),
    );
  }
}
