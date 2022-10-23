import 'dart:async';

import 'package:clean_architecture_app/presentation/base/base_view_model.dart';
import 'package:clean_architecture_app/presentation/common/freezed_data_class.dart';

import '../../../domain/use_case/login_use_case.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{

  final StreamController _userNameController=StreamController<String>.broadcast();
  final StreamController _passwordController=StreamController<String>.broadcast();
  final StreamController _areAllInputValidController=StreamController<void>.broadcast();
  var loginViewObject=LoginObject("","");

 //final LoginUseCase _loginUseCase;
//LoginViewModel(this._loginUseCase);
LoginViewModel();


  // inputs
  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.close();
    _passwordController.close();
    _areAllInputValidController.close();

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
  // TODO: implement inputAreAllInputValid
  Sink get inputAreAllInputValid =>_areAllInputValidController.sink;

  @override
  login() async{
    // ( await _loginUseCase.execute(LoginUseCaseInput(loginViewObject.userName, loginViewObject.Password))).fold((failure) =>
    // {
    // //
    // }, (data) => {
    //    print(data.customer?.name)
    // });
  }
// outputs
  @override

  Stream<bool> get outIsPasswordValid => _passwordController.stream.map((password) => _isPasswordValid(password));

  @override

  Stream<bool> get outIsUserNameValid => _userNameController.stream.map((userName) => _isUserNameValid(userName));


  @override

  Stream<bool> get outAreAllInputValid => _areAllInputValidController.stream.map((_) => _areAllInputValid());

  bool _isPasswordValid(String password){
    return password.isNotEmpty;

  }
  bool _areAllInputValid(){
    return _isPasswordValid(loginViewObject.Password)&&_isUserNameValid(loginViewObject.userName);
  }

  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;

  }

  @override
  setPassword(String Password) {
    inputPassword.add(Password);
    loginViewObject.copyWith(Password: Password);
    inputAreAllInputValid.add(null);
  }

  @override
  setUserName(String UserName) {
   inputUserName.add(UserName);
   loginViewObject.copyWith(userName: UserName);
   inputAreAllInputValid.add(null);


  }





}

abstract class  LoginViewModelInputs{
setUserName(String UserName);
setPassword(String Password);
login();
Sink get inputUserName;
Sink get inputPassword;
Sink get inputAreAllInputValid;
}

abstract class LoginViewModelOutputs{
  Stream<bool>get outIsUserNameValid;
  Stream<bool>get outIsPasswordValid;
  Stream<bool>get outAreAllInputValid;
}