
import 'package:clean_architecture_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class CustomCircle extends StatelessWidget {
final   bool? solid;
  const CustomCircle({Key? key,this.solid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all( AppPadding.p14),
        child: Container(
          height: AppSize.s10,
          width: AppSize.s10,
          decoration: BoxDecoration(
            color: solid==true?Colors.transparent:ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s50),
            border: Border.all(color: Colors.white),
          ),
        ));
  }
}
