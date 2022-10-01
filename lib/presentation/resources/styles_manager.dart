import 'package:flutter/cupertino.dart';

import 'font_manger.dart';

TextStyle _getTextStyle(double fontSize,FontWeight fontWeight,Color color){
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily
  );
}
//regular style
TextStyle getRegularStyle({double fontSize=FontSize.s12, required Color color}){
  return _getTextStyle(fontSize,FontWeightManger.regular,color);
}
//bold style
TextStyle getBoldStyle({double fontSize=FontSize.s12, required Color color}){
  return _getTextStyle(fontSize,FontWeightManger.bold,color);
}
//medium style
TextStyle getMediumStyle({double fontSize=FontSize.s12, required Color color}){
  return _getTextStyle(fontSize,FontWeightManger.medium,color);
}

//semiBold style
TextStyle getSemiBoldStyle({double fontSize=FontSize.s12, required Color color}){
  return _getTextStyle(fontSize,FontWeightManger.semiBold,color);
}
TextStyle getLightStyle({double fontSize=FontSize.s12, required Color color}){
  return _getTextStyle(fontSize,FontWeightManger.light,color);
}