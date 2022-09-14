import 'dart:async';

import 'package:clean_architecture_app/domain/models.dart';
import 'package:clean_architecture_app/presentation/base/base_view_model.dart';

import '../../resources/app_strings.dart';
import '../../resources/assets_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput,OnBoardingViewModelOutput {
  StreamController _streamController=StreamController<SliderViewObject>();
  late final List<SliderObject>_list;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list=_getSliderData();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outPutSliderViewObject
  Stream<SliderViewObject> get outPutSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);


  List<SliderObject>_getSliderData()=>[
    SliderObject(AppString.onBoardingTitle1, AppString.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppString.onBoardingTitle2, AppString.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppString.onBoardingTitle3, AppString.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
  ];
}
 abstract class OnBoardingViewModelInput{
void goNext();
void goPrevious();
void onPageChanged(int index);
Sink get  inputSliderViewObject;
}
abstract class OnBoardingViewModelOutput{
  Stream<SliderViewObject> get  outPutSliderViewObject;

}
