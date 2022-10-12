// convert customer response to customer model //to domain // from data to domain
import 'package:clean_architecture_app/app/constant.dart';
import 'package:clean_architecture_app/data/responses.dart';
import 'package:clean_architecture_app/domain/models/models.dart';
import 'package:clean_architecture_app/app/extention.dart';

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
    return Customer(this?.id.orEmpty()?? "", this?.name.orEmpty()??Constants.empty, this ?.numOFNotifications.orZero()?? Constants.zero );
}
}
extension ContactResponseMapper on ContactResponse?{
  Contact toDomain(){
    return Contact(this?.phone.orEmpty()?? "", this?.email.orEmpty()??Constants.empty, this ?.link.orEmpty()?? Constants.empty );
  }
}


extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication( this?.contacts.toDomain(),this?.customer.toDomain() );
  }
}