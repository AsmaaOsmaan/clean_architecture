class SliderObject{
  String title;
  String subTitle;
  String image;
  SliderObject(this.title,this.subTitle,this.image);
}
class SliderViewObject{
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject,this.currentIndex,this.numOfSlides);


}
class Customer{
  String id;
  String name;
  int numOFNotifications;
  Customer(this.id,this.name,this.numOFNotifications);
}
class Contact{
  String phone;
  String email;
  String link;

  Contact(this.email,this.link,this.phone);
}
class Authentication{
  Contact? contacts;
  Customer? customer;
  Authentication(this.contacts,this.customer);

}