
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "statues")
  int? statues;
  @JsonKey(name: "message")
  String? message;
}
@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOFNotifications")
  int? numOFNotifications;
}




@JsonSerializable()
class ContactResponse{
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
}





@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactResponse? contacts;

}







