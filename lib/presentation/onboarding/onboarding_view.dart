
import 'package:clean_architecture_app/presentation/resources/app_strings.dart';
import 'package:clean_architecture_app/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_app/presentation/resources/color_manager.dart';
import 'package:clean_architecture_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
return onBoardingPage(sliderObject: _list[index],);
      },
      controller: _pageController,
      itemCount: _list.length,
      onPageChanged: (index){
setState(() {
  currentIndex=index;
});
      },),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {  },
                child: Text(AppString.skip,textAlign: TextAlign.end,),
              ),
            ),
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }
  Widget _getBottomSheetWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: EdgeInsets.all(AppPadding.p14),
        child:SizedBox(
          width: AppSize.s20,
          height: AppSize.s20,
          child: Icon(Icons.arrow_back_ios),
        )
          ,),



        Row(
children: [
  for(int i=0;i<_list.length;i++)
    Padding(padding: EdgeInsets.all(AppPadding.p8),
      child: _getPropertiesCircle(i),


    )
],
        ),
        Padding(padding: EdgeInsets.all(AppPadding.p14),
          child:SizedBox(
            width: AppSize.s20,
            height: AppSize.s20,
            child: Icon(Icons.arrow_forward_ios_outlined),
          )
          ,)
      ],
    );
  }
  Widget _getPropertiesCircle(int index){
    if(index==currentIndex){
      return Image.asset(ImageAssets.hollow_circle_ic);
    }
    else{
      return Image.asset(ImageAssets.solid_circle_ic);

    }

  }
}
class onBoardingPage extends StatelessWidget {
  final SliderObject? sliderObject;
   onBoardingPage({Key? key, this.sliderObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
 const SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(sliderObject!.title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(sliderObject!.subTitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineMedium,),

        ),
        const SizedBox(height: AppSize.s60,),
        SvgPicture.asset(sliderObject!.image)

      ],
    );
  }
}

class SliderObject{
  String title;
  String subTitle;
  String image;
  SliderObject(this.title,this.subTitle,this.image);
}