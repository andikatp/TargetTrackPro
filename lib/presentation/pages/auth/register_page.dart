import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/user.dart';
import 'package:business/presentation/blocs/auth/bloc/auth_bloc.dart';
import 'package:business/presentation/pages/auth/login_page.dart';
import 'package:business/presentation/widgets/auth/input_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserRole selectedRole = UserRole.user;

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

  void registerHandler() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final newUser =
          User(email: email, password: password, role: selectedRole);
      context.read<AuthBloc>().add(AuthRegisterEvent(user: newUser));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum:
            REdgeInsets.symmetric(horizontal: Sizes.p36, vertical: Sizes.p48)
                .copyWith(bottom: 0),
        child: Form(
          key: formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthRegistered) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please Login Now')),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const LoginPage(),
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
                      label: 'Email',
                      icon: Icons.person,
                      validator: emailValidator,
                    ),
                    Gap.h20,
                    PasswordInputField(controller: passwordController),
                    Gap.h20,
                    Wrap(
                      runSpacing: Sizes.p12,
                      children: [
                        Text('Role', style: context.labelMedium),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<UserRole>(
                            value: selectedRole,
                            buttonStyleData: ButtonStyleData(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: REdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            style: context.titleSmall,
                            items: UserRole.values
                                .map(
                                  (userRole) => DropdownMenuItem<UserRole>(
                                    value: userRole,
                                    child: Text(userRole.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => selectedRole = value!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap.h28,
                    if (state is AuthRegisterError)
                      Text(
                        state.message,
                        style: context.bodySmall
                            .copyWith(fontSize: 14.sp, color: Colors.red),
                      ),
                    Gap.h20,
                    ElevatedButton(
                      onPressed: state is AuthLoading ? null : registerHandler,
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
                          : const Text('Register'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => const LoginPage(),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style:
                            context.bodySmall.copyWith(color: Colours.redColor),
                      ),
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
