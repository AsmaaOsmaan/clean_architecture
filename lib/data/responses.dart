
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';
part 'responses.g.dart';
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
  CustomerResponse(this.name,this.id,this.numOFNotifications);
  //fromJson
  factory CustomerResponse.fromJson(Map<String,dynamic>json)=>_$CustomerResponseFromJson(json);
  //toJson
  Map<String,dynamic> toJson()=>_$CustomerResponseToJson(this);

}




@JsonSerializable()
class ContactResponse{
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactResponse(this.email,this.link,this.phone);
  //fromJson
  factory ContactResponse.fromJson(Map<String,dynamic>json)=>_$ContactResponseFromJson(json);
  //toJson
  Map<String,dynamic> toJson()=>_$ContactResponseToJson(this);

}





@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactResponse? contacts;

  AuthenticationResponse(this.contacts,this.customer);
  //fromJson
  factory AuthenticationResponse.fromJson(Map<String,dynamic>json)=>_$AuthenticationResponseFromJson(json);
  //toJson
 Map<String,dynamic> toJson()=>_$AuthenticationResponseToJson(this);

}







