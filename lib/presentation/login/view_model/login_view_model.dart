import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:wellos/presentation/base/baseviewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  //input
  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  //output
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  // TODO: implement outIsUserNameValid
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
  }

  @override
  void start() {
    // TODO: implement start
  }
}

mixin LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}
