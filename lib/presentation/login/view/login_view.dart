import 'package:flutter/material.dart';
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
  final LoginViewModel _viewModel = LoginViewModel(_loginUseCase());

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
      body: Container(
          padding: EdgeInsets.only(top: AppPadding.p100),
          color: ColorManager.white,
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
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.invalidUserName,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  //password
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: AppStrings.passwordHint,
                            labelText: AppStrings.passwordHint,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.forgotPassword,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                                    _viewModel.login();
                                  }
                                : null,
                            child: Text(AppStrings.login));
                      },
                    ),
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
