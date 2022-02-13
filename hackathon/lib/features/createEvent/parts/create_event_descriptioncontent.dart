part of create_event.dart;

class EventDescriptionContent extends StatelessWidget {
  const EventDescriptionContent({
    Key? key,
    required TextEditingController descriptionController,
  })  : _descriptionController = descriptionController,
        super(key: key);

  final TextEditingController _descriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: CreateEventPadding.descriptionContentContainerMargin,
      child: Column(
        children: [
          Container(
            padding: CreateEventPadding.descriptionContentContainerPadding,
            alignment: Alignment.centerLeft,
            child: MyText(CreateEventStrings.eventDescription, 20,
                ThemePurple.blackColor),
          ),
          _buildCreateEventDescriptionContainer(),
        ],
      ),
    );
  }

  Widget _buildCreateEventDescriptionContainer() {
    return Container(
            margin: CreateEventPadding.descriptionContentContainer,
            child: TextFormField(
              // key: ValueKey(valKey),
              validator: (val) {
                if (val!.isEmpty) {
                  return CreateEventStrings.eventDescriptionRequired;
                }
                return null;
              },

              controller: _descriptionController,
              keyboardType: TextInputType.text,
              maxLines: 2,
              decoration: InputDecoration(
                contentPadding: CreateEventPadding.descriptionContentInput,
                hintText: CreateEventStrings.eventDescriptionHint,
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemePurple.greyColor, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: theme.primaryColor, width: 1)),
              ),
            ));
  }
}
