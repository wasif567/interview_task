import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/app/router/router_constant.dart';
import 'package:interview_task/src/application/auth/auth_bloc.dart';
import 'package:interview_task/src/application/core/status.dart';
import 'package:interview_task/src/infrastructure/core/check_internet/check_internet_connectivity.dart';
import 'package:interview_task/src/presentation/core/constants/app_colors.dart';
import 'package:interview_task/src/presentation/core/constants/app_constants.dart';
import 'package:interview_task/src/presentation/core/widget/custom_textfield.dart';
import 'package:interview_task/src/presentation/core/widget/footer_btn.dart';

import '../../core/constants/app_strings.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  ValueNotifier<String?> errorUserName = ValueNotifier<String?>(null);
  ValueNotifier<String?> errorPassword = ValueNotifier<String?>(null);

  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String userName = '';
  String password = '';

  @override
  void initState() {
    // context.read<AuthBloc>().add(const AuthIntial());
    if (kDebugMode) {
      email.text = 'test@zoftcares.com';
      passwordController.text = '12345';
    }
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    passwordController.dispose();
    errorUserName.dispose();
    errorPassword.dispose();
    obscureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    final keyBoardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SizedBox(
            height: kSize.height,
            width: kSize.width,
            child: portraitView(kSize, keyBoardVisible),
          ),
        ));
  }

  Widget portraitView(Size kSize, bool isKeyBoardVisible) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginStatus is StatusLoading) {
        } else if (state.loginStatus is StatusSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, RouterConstant.bottonNavRoute, (route) => false);
        } else if (state.loginStatus is StatusFailure) {
          errorUserName.value = state.errorUser!;
          errorPassword.value = state.errorPassword!;
        } else if (state.loginStatus is StatusAuthFailure) {
        } else if (state.loginStatus is BusinessFailure) {
        } else if (state.loginStatus is TimeOutStatus) {}
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              height: kSize.height,
              width: kSize.width,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    right: AppConstants.basePadding,
                    left: AppConstants.basePadding),
                child: Column(
                  mainAxisAlignment: isKeyBoardVisible ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: errorUserName,
                        builder: (context, value, child) {
                          return CustomTextField(
                              textInputAction: TextInputAction.next,
                              label: "Email",
                              hint: "Enter email",
                              errorStyle: errorUserName.value != null && errorUserName.value!.isNotEmpty
                                  ? const TextStyle(fontSize: 0, height: 0)
                                  : null,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  errorUserName.value = null;
                                }
                              },
                              errorMessage: errorUserName.value != null && errorUserName.value!.isNotEmpty
                                  ? errorUserName.value!
                                  : null,
                              controller: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username can't be empty";
                                } else {
                                  return null;
                                }
                              });
                        }),
                    SizedBox(
                      height: kSize.height * 0.01,
                    ),
                    ValueListenableBuilder<bool>(
                        valueListenable: obscureText,
                        builder: (context, value, child) {
                          return ValueListenableBuilder(
                              valueListenable: errorPassword,
                              builder: (context, passwordValue, child) {
                                return CustomTextField(
                                  label: "Password",
                                  hint: AppStrings.passwordHint,
                                  errorMessage: errorUserName.value != null &&
                                          errorPassword.value != null &&
                                          errorPassword.value!.isNotEmpty
                                      ? "${errorUserName.value!} or ${errorPassword.value!}"
                                      : null,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      errorPassword.value = null;
                                    }
                                  },
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can't be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: value,
                                  suffixIcon: InkWell(
                                    focusColor: AppColors.transparent,
                                    hoverColor: AppColors.transparent,
                                    highlightColor: AppColors.transparent,
                                    onTap: () {
                                      obscureText.value = !obscureText.value;
                                    },
                                    child: obscureText.value
                                        ? const Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 24,
                                          )
                                        : const Icon(
                                            Icons.remove_red_eye,
                                            size: 24,
                                            color: AppColors.darkGrey,
                                          ),
                                  ),
                                  onFieldSubmitted: (value) async {
                                    if (_formKey.currentState!.validate()) {
                                      if (await CheckInternet(parentContext: context).checkInternet()) {
                                        if (context.mounted) {
                                          context.read<AuthBloc>().add(const AuthIntial());
                                          context.read<AuthBloc>().add(LoginEvent(
                                              userName: email.text, password: passwordController.text));
                                        }
                                      } else {
                                        if (context.mounted) {
                                          context.read<AuthBloc>().add(LoginEvent(
                                                userName: email.text,
                                                password: passwordController.text,
                                              ));
                                        }
                                      }
                                    }
                                  },
                                );
                              });
                        }),
                    SizedBox(
                      height: kSize.height * 0.01,
                    ),
                    state.loginStatus is StatusLoading
                        ? const DecoratedBox(
                            decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: AppColors.primaryColor,
                                backgroundColor: AppColors.white,
                              ),
                            ),
                          )
                        : FooterButton(
                            height: kSize.height < 670 ? kSize.height * 0.070 : null,
                            label: "Log In",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                //
                                context.read<AuthBloc>().add(LoginEvent(
                                      userName: email.text,
                                      password: passwordController.text,
                                    ));
                              }
                            }),
                    SizedBox(
                      height: kSize.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
