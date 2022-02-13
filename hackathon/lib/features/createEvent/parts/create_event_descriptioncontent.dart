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
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: MyText("Event Description", 20, Colors.black),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                // key: ValueKey(valKey),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Event description is required';
                  }
                  return null;
                },

                controller: _descriptionController,
                keyboardType: TextInputType.text,
                maxLines: 2,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  hintText: 'Description...',
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.primaryColor, width: 1)),
                ),
              )),
        ],
      ),
    );
  }
}
