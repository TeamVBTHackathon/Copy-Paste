part of create_event.dart;

class AddImageContainer extends StatefulWidget {
  File? _image;

  AddImageContainer(this._image, {Key? key}) : super(key: key);

  @override
  State<AddImageContainer> createState() => _AddImageContainerState();
}

class _AddImageContainerState extends State<AddImageContainer> {
  List icon = [Icons.camera_alt, Icons.image, Icons.remove_circle];

  List iconText = ["Camera", "Gallery", "Remove"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: widget._image == null
              ? Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: ThemePurple.greyColor,
                    ),
                  ),
                )
              : Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: ThemePurple.greyColor,
                    ),
                  ),
                  child: Image.file(widget._image!)),
        ),

        //select Menu
        SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //selecting event photo
              for (var i = 0; i < 3; i++)
                InkWell(
                  onTap: () => i == 0
                      ? _getCameraImage()
                      : i == 1
                          ? _getGalleryImage()
                          : _removeImage(),
                  child: SizedBox(
                    width: context.width / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(icon[i]), Text(iconText[i])],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Future _getCameraImage() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      widget._image = File(image2!.path);
    });
  }

  Future _getGalleryImage() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      widget._image = File(image2!.path);
    });
  }

  void _removeImage() {
    setState(() {
      widget._image = null;
    });
  }
}
