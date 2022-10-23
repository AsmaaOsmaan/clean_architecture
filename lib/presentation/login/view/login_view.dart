import 'package:clean_architecture_app/presentation/login/view_model/login_view_model.dart';
import 'package:clean_architecture_app/presentation/resources/color_manager.dart';
import 'package:clean_architecture_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

import '../../resources/app_strings.dart';
import '../../resources/assets_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
//  LoginViewModel _viewModel=LoginViewModel(_loginUseCase);
  LoginViewModel _viewModel=LoginViewModel();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _viewModel.dispose();
    super.dispose();
  }
  _bind(){
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _viewModel.setUserName(_passwordController.text);
    });// tell viewmodel start ur job
  }
  @override
  void initState() {
    _bind();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }
  Widget _getContentWidget(){
    return Scaffold(
body:  Container(
padding:const EdgeInsets.only(top: AppPadding.p100),
  color: ColorManager.white,
  child: SingleChildScrollView(
    child: Form(
      key: _formKey,
      child:Column(
        children: [
        const  Center(child: Image(image: AssetImage(ImageAssets.splashLogo),)),
          const  SizedBox(height: AppSize.s28,),
          Padding(padding:const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p20),
            child: StreamBuilder<bool>(
              stream: _viewModel.outIsUserNameValid,
              builder: (context,snapshot){
                return TextFormField(
                  controller: _userNameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: AppString.userName,
                    labelText: AppString.userName,
                    errorText: (snapshot.data??true)?null:AppString.userNameError,

                  ),
                );
              },
            ),
          ),
          //password
          const  SizedBox(height: AppSize.s28,),
          Padding(padding:const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p20),
            child: StreamBuilder<bool>(
              stream: _viewModel.outIsPasswordValid,
              builder: (context,snapshot){
                return TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: AppString.password,
                    labelText: AppString.password,
                    errorText: (snapshot.data??true)?null:AppString.passwordError,

                  ),
                );
              },
            ),
          ),
          // button


          const  SizedBox(height: AppSize.s28,),
          Padding(padding:const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p20),
            child: StreamBuilder<bool>(
              stream: _viewModel.outAreAllInputValid,
              builder: (context,snapshot){
                return ElevatedButton(onPressed:
                (snapshot.data??false)?
                    (){

              _viewModel.login();

                }:null, child:const Text(AppString.login));
              },
            ),
          ),
        ],
      ) ,

    ),
  ),

),
    );
  }
}
