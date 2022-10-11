import 'package:clean_architecture_app/presentation/login/view_model/login_view_model.dart';
import 'package:clean_architecture_app/presentation/resources/color_manager.dart';
import 'package:clean_architecture_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // LoginViewModel _viewModel=LoginViewModel(_loginUseCase);
  // TextEditingController _userNameController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  // final _formKey=GlobalKey<FormState>();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _viewModel.dispose();
  //   super.dispose();
  // }
  // _bind(){
  //   _viewModel.start();
  //   _userNameController.addListener(() {
  //     _viewModel.setUserName(_userNameController.text);
  //   });
  //   _passwordController.addListener(() {
  //     _viewModel.setUserName(_passwordController.text);
  //   });// tell viewmodel start ur job
  // }
  // @override
  // void initState() {
  //   _bind();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
//   Widget _getContentWidget(){
//     return Scaffold(
// body:  Container(
// padding: EdgeInsets.only(top: AppPadding.p100),
//   color: ColorManager.white,
//   child: SingleChildScrollView(
//     child: Form(
//       key: _formKey,
//       child: ,
//
//     ),
//   ),
//
// ),
//     );
//   }
}
