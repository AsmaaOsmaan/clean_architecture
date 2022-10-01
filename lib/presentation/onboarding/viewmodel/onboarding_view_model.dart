import 'dart:async';

import 'package:clean_architecture_app/domain/models/models.dart';
import 'package:clean_architecture_app/presentation/base/base_view_model.dart';

import '../../resources/app_strings.dart';
import '../../resources/assets_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput,OnBoardingViewModelOutput {
  StreamController _streamController=StreamController<SliderViewObject>();
  late final List<SliderObject>_list;
  int currentIndex=0;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list=_getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    // TODO: implement goNext
    int nextIndex=++currentIndex;
    if(nextIndex==_list.length){
      nextIndex=0;

    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    // TODO: implement goPrevious


    int previousIndex=--currentIndex;
    if(previousIndex==-1){
      previousIndex=_list.length-1;

    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
    currentIndex=index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outPutSliderViewObject
  Stream<SliderViewObject> get outPutSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);


  void _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[currentIndex], currentIndex, _list.length));
  }


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
