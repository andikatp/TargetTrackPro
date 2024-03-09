import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/presentation/blocs/auth/bloc/auth_bloc.dart';
import 'package:business/presentation/pages/main/main_page.dart';
import 'package:business/presentation/widgets/auth/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    String? emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      final regex = RegExp(emailPattern);

      if (!regex.hasMatch(value)) {
        return 'Please check your email address';
      }
      return null;
    }

    void loginHandler() {
      FocusManager.instance.primaryFocus?.unfocus();
      if (formKey.currentState!.validate()) {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        context
            .read<AuthBloc>()
            .add(AuthLoginEvent(email: email, password: password));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum:
            REdgeInsets.symmetric(horizontal: Sizes.p36, vertical: Sizes.p48),
        child: Form(
          key: formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedIn) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const MainPage(),
                  ),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    GeneralInputField(
                      type: TextInputType.name,
                      controller: emailController,
                      label: 'Username',
                      icon: Icons.person,
                      validator: emailValidator,
                    ),
                    Gap.h20,
                    PasswordInputField(controller: passwordController),
                    Gap.h28,
                    if (state is AuthError)
                      Text(
                        state.message,
                        style: context.bodySmall
                            .copyWith(fontSize: 14.sp, color: Colors.red),
                      ),
                    Gap.h20,
                    ElevatedButton(
                      onPressed: state is AuthLoading ? null : loginHandler,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colours.redColor,
                        foregroundColor: Colours.whiteColor,
                        minimumSize: const Size.fromHeight(Sizes.p72),
                        shadowColor: Colors.black12,
                        elevation: 0,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16).r,
                        ),
                      ),
                      child: state is AuthLoading
                          ? const CupertinoActivityIndicator()
                          : const Text('Login'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
