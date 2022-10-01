
import 'dart:async';

import 'package:clean_architecture_app/presentation/resources/color_manager.dart';
import 'package:clean_architecture_app/presentation/resources/routs_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/constants_manager.dart';
class SplahView extends StatefulWidget {
  const SplahView({Key? key}) : super(key: key);

  @override
  State<SplahView> createState() => _SplahViewState();
}

class _SplahViewState extends State<SplahView> {
  Timer? _timer;
  _startDelay(){
    _timer=Timer(Duration(seconds: AppConstants.splashDelay),_goNext);
  }
  _goNext(){
Navigator.popAndPushNamed(context, Routes.onBoardingRoute);
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo),)),
    );
  }
}
