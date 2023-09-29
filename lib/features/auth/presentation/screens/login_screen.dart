part of features.auth.presentation.screens;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm();

  void showSnackbar(BuildContext context, String messageError) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messageError)),
    );
  }

  void _submitEmail(BuildContext context) {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    final loginForm = context.watch<LoginFormBloc>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          Text('Login', style: textStyles.titleLarge),
          const SizedBox(height: 50),
          CustomTextFormField(
            onFieldSubmitted: (_) => _submitEmail(context),
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: context.read<LoginFormBloc>().onEmailChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            focusNode: _passwordFocusNode,
            label: 'Password',
            obscureText: true,
            onChanged: context.read<LoginFormBloc>().onPasswordChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'LogIn',
                buttonColor: Colors.black,
                onPressed: loginForm.isPosting
                    ? null
                    : context.read<LoginFormBloc>().onformSubmit,
              )),
        ],
      ),
    );
  }
}
