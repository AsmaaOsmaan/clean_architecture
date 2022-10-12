import 'package:clean_architecture_app/presentation/resources/routs_manager.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/theme_manager.dart';
// test push to hussain
// main
// test push to asmaa
// test push to jjj
class MyApp extends StatefulWidget {
 // const MyApp({Key? key}) : super(key: key);
  MyApp._internal();
  static final MyApp _instance=MyApp._internal();//singleton or single instance
  factory MyApp()=>_instance;//factory


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
      theme: getApplecationTheme(

      ),
    );
  }
}
