

abstract class BaseViewModel extends BaseViewModelInput with BaseViewModelOutput {

}

abstract class BaseViewModelInput{
void start();//start view model job
void dispose();//will be call when view model  dies
}




abstract class BaseViewModelOutput{

}
