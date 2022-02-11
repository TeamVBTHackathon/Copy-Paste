part of login_view;

class LoginViewBody2 extends StatelessWidget {
  LoginViewBody2({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewModelCubit(
        emailController: emailController,
        passwordController: passwordController,
        formKey: formKey,
        service: LoginService(),
      ),
      child: BlocConsumer<LoginViewModelCubit, LoginViewModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Form buildScaffold(BuildContext context, LoginViewModelState state) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode(state),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTextFormFieldLogin(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          buildTextFormFieldPassword(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          buildElevatedButtonLogin(context),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Cubit Login'),
      leading: Visibility(
        visible: context.watch<LoginViewModelCubit>().isLoading,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  AutovalidateMode autovalidateMode(LoginViewModelState state) => state
          is LoginValidateState
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  TextFormField buildTextFormFieldLogin() {
    return TextFormField(
      controller: emailController,
      validator: (value) => (value ?? '').length > 6 ? null : '6 ten kucuk',
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Email'),
    );
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      controller: passwordController,
      validator: (value) => (value ?? '').length > 5 ? null : '5 ten kucuk',
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Password'),
    );
  }

  Widget buildElevatedButtonLogin(BuildContext context) {
    return BlocConsumer<LoginViewModelCubit, LoginViewModelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ElevatedButton(
          onPressed: context.watch<LoginViewModelCubit>().isLoading
              ? null
              : () {
                  context.read<LoginViewModelCubit>().postUserModel();
                },
          child: const Text('Save'),
        );
      },
    );
  }
}
