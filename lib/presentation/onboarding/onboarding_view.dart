
import 'package:clean_architecture_app/presentation/resources/app_strings.dart';
import 'package:clean_architecture_app/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject>_list=_getSliderData();
  PageController _pageController=PageController();
  int currentIndex=0;
  List<SliderObject>_getSliderData()=>[
   SliderObject(AppString.onBoardingTitle1, AppString.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
   SliderObject(AppString.onBoardingTitle2, AppString.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
   SliderObject(AppString.onBoardingTitle3, AppString.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ColorManager.white,statusBarBrightness: Brightness.dark),

      ),
      body: PageView.builder(itemBuilder: (context,index){
return Container();
      },
      controller: _pageController,
      itemCount: _list.length,
      onPageChanged: (index){
setState(() {
  currentIndex=index;
});
      },),
    );
  }
}
class onBoardingPage extends StatelessWidget {
  final SliderObject? sliderObject;
   onBoardingPage({Key? key, this.sliderObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SliderObject{
  String title;
  String subTitle;
  String image;
  SliderObject(this.title,this.subTitle,this.image);
}