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
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: MyText("Event Title", 20, Colors.black),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                // key: ValueKey(valKey),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },

                controller: _titleController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    hintText: 'Example Company',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1))),
              )),
        ],
      ),
    );
  }
}
