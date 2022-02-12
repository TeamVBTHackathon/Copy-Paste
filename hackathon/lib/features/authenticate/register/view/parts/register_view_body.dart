part of register_view;

class RegisterViewBody extends StatefulWidget {
  RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  final List<String> dropdownGender = ['Erkek', 'Kadın'];

  XFile? imageXFile;

  final ImagePicker _pickerImage = ImagePicker();

  dynamic storeImageUrl;

  dynamic _pickImage;

  Position? position;

  List<Placemark>? placeMarks;

  String completeAdress = "";

  String _city = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterViewCubit(
        addresController: locationController,
        emailController: emailController,
        nameController: nameController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
        imageController: storeImageUrl,
        formKey: formKey,
        service: RegisterService(),
      ),
      child: BlocConsumer<RegisterViewCubit, RegisterViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _form(context);
        },
      ),
    );
  }

  Form _form(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _bodyImage(),
          nameTextField(),
          emailTextField(),
          passwordTextField(),
          _locationTextField(),
          getMyLocation(),
          _registerButton(context),
          _goToLoginPage(context),
        ],
      ),
    );
  }

  CustomTextFormFieldWidget emailTextField() {
    return CustomTextFormFieldWidget(
      controller: emailController,
      labelText: 'Email',
      icon: const Icon(Icons.email),
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Geçerli bir mail adresi giriniz.';
        } else {
          return '';
        }
      },
    );
  }

  CustomTextFormFieldWidget passwordTextField() {
    bool isVisible = true;

    void _changeVisibility() {
      setState(() {
        print(isVisible);
        isVisible = !isVisible;
        print(isVisible);
      });
    }

    return CustomTextFormFieldWidget(
      controller: passwordController,
      labelText: "Şifre",
      icon: const Icon(Icons.lock),
      isObsecure: isVisible,
      validator: (value) {
        if (value!.isEmpty || value.length < 8) {
          return 'Şifre en az 8 karakterden oluşmalıdır.';
        }
        return '';
      },
      iconButton: IconButton(
        onPressed: () {
          _changeVisibility();
        },
        icon: isVisible
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
      ),
    );
  }

  CustomTextFormFieldWidget nameTextField() {
    return CustomTextFormFieldWidget(
      controller: nameController,
      labelText: "İsim",
      icon: const Icon(Icons.person),
    );
  }

  CustomTextFormFieldWidget _locationTextField() {
    return CustomTextFormFieldWidget(
      controller: locationController,
      icon: const Icon(Icons.location_on),
      labelText: "Konum",
      isEnabled: false,
    );
  }

  Column _bodyImage() {
    return Column(
      children: [
        Center(child: getMyProfilPhoto()),
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }

  void _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        storeImageUrl = pickedFile!;
      });
    } catch (error) {
      setState(() {
        _pickImage = error;
      });
    }
  }

  InkWell getMyProfilPhoto() {
    return InkWell(
      onTap: () {
        _onImageButtonPressed(
          ImageSource.gallery,
          context: context,
        );
      },
      child: storeImageUrl == null
          ? CircleAvatar(
              radius: context.width * 0.20,
              backgroundColor: Colors.grey.shade100,
              backgroundImage: storeImageUrl == null
                  ? null
                  : FileImage(File(storeImageUrl!.path)),
              child: storeImageUrl == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: context.width * 0.2,
                      color: Colors.grey,
                    )
                  : null,
            )
          : CircleAvatar(
              radius: context.width * 0.2,
              backgroundColor: Colors.white,
              backgroundImage: FileImage(File(storeImageUrl!.path)),
              child: storeImageUrl == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: context.width * 0.2,
                      color: Colors.grey,
                    )
                  : null,
            ),
    );
  }

  Container getMyLocation() {
    return Container(
      width: context.width * 0.8,
      height: context.height * 0.08,
      alignment: Alignment.center,
      child: ElevatedButton.icon(
        onPressed: () {
          getCurrentLocation();
        },
        icon: const Icon(Icons.location_on),
        label: const Text("Konumumu Al"),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.height * 0.04),
            )),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    position = newPosition;

    placeMarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    Placemark pMark = placeMarks![0];
    setState(() {
      _city = pMark.administrativeArea!;
    });
    completeAdress = '${pMark.administrativeArea}';

    locationController.text = completeAdress;
  }

  Widget _registerButton(BuildContext context) {
    return BlocConsumer<RegisterViewCubit, RegisterViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
            onTap: context.read<RegisterViewCubit>().isLoading
                ? null
                : () {
                    context
                        .read<RegisterViewCubit>()
                        .updateItems(storeImageUrl);
                  },
            child: Padding(
              padding: EdgeInsets.all(context.height * 0.01),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(context.width * 0.04),
                ),
                height: context.height * 0.05,
                width: context.width * 0.5,
                child: const Center(
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  InkWell _goToLoginPage(BuildContext context) {
    return InkWell(
        onTap: () => {},
        child: Padding(
          padding: EdgeInsets.all(context.height * 0.01),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(context.width * 0.04),
            ),
            height: context.height * 0.05,
            width: context.width * 0.5,
            child: const Center(
              child: Text(
                "Zaten Üye Misin ?",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}
