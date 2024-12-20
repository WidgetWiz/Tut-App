import 'package:flutter/material.dart';
import 'package:wellos/app/di.dart';
import 'package:wellos/domain/usecase/login_usecase.dart';
import 'package:wellos/presentation/login/view_model/login_view_model.dart';
import 'package:wellos/presentation/resources/color_manager.dart';
import 'package:wellos/presentation/resources/stringes_manager.dart';
import 'package:wellos/presentation/resources/values_manager.dart';

import '../../resources/assets_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
          padding: EdgeInsets.only(top: AppPadding.p100),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Center(
                      child: Image(image: AssetImage(ImageAssets.splashLogo))),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outIsUserNameValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: AppStrings.usernameHint,
                            labelText: AppStrings.usernameHint,
                            hintStyle: TextStyle(color: ColorManager.grey),
                            labelStyle: TextStyle(color: ColorManager.primary),
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.invalidUserName,
                            errorStyle: TextStyle(color: ColorManager.error),
                            prefixIcon: Icon(Icons.person,
                                color: ColorManager
                                    .primary), // Icon before the text
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: AppSize.s20),

// Password field with similar enhancements
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          obscureText: true, // Hide password input
                          decoration: InputDecoration(
                            hintText: AppStrings.passwordHint,
                            labelText: AppStrings.passwordHint,
                            hintStyle: TextStyle(color: ColorManager.grey),
                            labelStyle: TextStyle(color: ColorManager.primary),
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.forgotPassword,
                            errorStyle: TextStyle(color: ColorManager.error),
                            prefixIcon: Icon(Icons.lock,
                                color: ColorManager
                                    .primary), // Lock icon before the password field
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: ColorManager.primary),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.s20),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.login();
                                    }
                                  : null,
                              child: Text(
                                AppStrings.login,
                                style: TextStyle(
                                  color: ColorManager.white,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppSize.s8, left: AppSize.s40, right: AppSize.s40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                AppStrings.forgotPassword,
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.end,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                AppStrings.register,
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.end,
                              )),
                        ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
