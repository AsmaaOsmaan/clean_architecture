

import 'package:clean_architecture_app/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:clean_architecture_app/presentation/onboarding/widgets/custom_circle.dart';
import 'package:clean_architecture_app/presentation/resources/app_strings.dart';
import 'package:clean_architecture_app/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_app/presentation/resources/color_manager.dart';
import 'package:clean_architecture_app/presentation/resources/constants_manager.dart';
import 'package:clean_architecture_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models/models.dart';
import '../../resources/routs_manager.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
 // late final List<SliderObject>_list=_getSliderData();
  PageController _pageController=PageController();

  OnBoardingViewModel viewModel=OnBoardingViewModel();
  _bind(){
    viewModel.start();
  }
  @override
  void initState(){
    _bind();
super.initState();
  }
  //int currentIndex=0;
  // List<SliderObject>_getSliderData()=>[
  //  SliderObject(AppString.onBoardingTitle1, AppString.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
  //  SliderObject(AppString.onBoardingTitle2, AppString.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
  //  SliderObject(AppString.onBoardingTitle3, AppString.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
  // ];

Widget getContent(SliderViewObject ? sliderViewObject){
  if (sliderViewObject==null){
    return Container();
  }else{
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ColorManager.white,statusBarBrightness: Brightness.dark),

      ),
      body: PageView.builder(itemBuilder: (context,index){
        return onBoardingPage(sliderObject: sliderViewObject.sliderObject);
      },
        controller: _pageController,
        itemCount: sliderViewObject.numOfSlides,
        onPageChanged: (index){
        viewModel.onPageChanged(index);
        },),
      bottomSheet: Container(
        color: ColorManager.white,
        // height: AppSize.s100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {


                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(AppString.skip,textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget(sliderViewObject)
          ],
        ),
      ),
    );
  }

}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: viewModel.outPutSliderViewObject,

        builder: (context, snapshot) {
return getContent(snapshot.data);
    });



  }
  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(AppPadding.p14),
          child:GestureDetector(
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: Icon(Icons.arrow_back_ios,color: ColorManager.white,size: AppSize.s20,),
            ),
            onTap: (){
              _pageController.animateToPage(viewModel.goPrevious(), duration: Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.bounceInOut);
            },
          )
            ,),



          Row(
children: [
  for(int i=0;i<sliderViewObject.numOfSlides;i++)
      Padding(padding: EdgeInsets.all(AppPadding.p8),
        child: _getPropertiesCircle(i,sliderViewObject.currentIndex),


      )
],
          ),
          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child:GestureDetector(
              onTap: (){
                _pageController.animateToPage(viewModel.goNext(), duration: Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.bounceInOut);

              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: Icon(Icons.arrow_forward_ios_outlined,color: ColorManager.white,size: AppSize.s20),
              ),
            )
            ,)
        ],
      ),
    );
  }


  //
  // int getPreviousIndex(){
  //   int previousIndex=--currentIndex;
  //   if(previousIndex==-1){
  //     previousIndex=_list.length-1;
  //
  //   }
  //   return previousIndex;
  // }
  //
  //
  // int getNextIndex(){
  //   int nextIndex=++currentIndex;
  //   if(nextIndex==_list.length){
  //     nextIndex=0;
  //
  //   }
  //   return nextIndex;
  // }









  Widget _getPropertiesCircle(int index,int currentIndex){
    if(index==currentIndex){
      return
        CustomCircle(solid: false,);

      //   Padding(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   child: Container(
      //     height: 20,
      //     width: 20,
      //     decoration: BoxDecoration(
      //       color: ColorManager.primary,
      //       borderRadius: BorderRadius.circular(50),
      //       border: Border.all(color: Colors.blueAccent),
      //   ),
      // ));


      //  Image.asset(ImageAssets.hollow_circle_ic);
    }
    else{
      return  const CustomCircle(solid: true,);


      //   Container(
      //   height: 50,
      //   width: 50,
      //   decoration: BoxDecoration(
      //       color: ColorManager.primary,
      //       borderRadius: BorderRadius.circular(50)
      //   ),
      // );

        //Image.asset(ImageAssets.solid_circle_ic);

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

