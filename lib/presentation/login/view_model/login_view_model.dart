import 'dart:async';

import 'package:clean_architecture_app/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{

  final StreamController _userNameController=StreamController<String>.broadcast();
  final StreamController _passwordController=StreamController<String>.broadcast();



  // inputs
  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.close();
    _passwordController.close();

  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameController.sink;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
// outputs
  @override
  // TODO: implement outIsPasswordVaild
  Stream<bool> get outIsPasswordValid => _passwordController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outIsUserNameVaild
  Stream<bool> get outIsUserNameValid => _userNameController.stream.map((userName) => _isUserNameValid(userName));


  bool _isPasswordValid(String password){
    return password.isNotEmpty;

  }

  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;

  }

  @override
  setPassword(String Password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String UserName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

}

abstract class  LoginViewModelInputs{
setUserName(String UserName);
setPassword(String Password);
login();
Sink get inputUserName;
Sink get inputPassword;
}

abstract class LoginViewModelOutputs{
  Stream<bool>get outIsUserNameValid;
  Stream<bool>get outIsPasswordValid;
}