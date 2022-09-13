import 'package:clean_architecture_app/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput,OnBoardingViewModelOutput {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
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



}
 abstract class OnBoardingViewModelInput{
void goNext();
void goPrevious();
void onPageChanged(int index);
}
abstract class OnBoardingViewModelOutput{

}