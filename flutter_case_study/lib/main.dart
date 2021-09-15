import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_case_study/resources/change_notifier_providers.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/routes.dart';
import 'package:provider/provider.dart';
import 'widgets/BottomBarWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: lightRed,
    ));
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Case Study',
        home: BottomBarWidget(),
        theme: ThemeData(
          fontFamily: "Roboto",
          backgroundColor: pageBG,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
        ),
        routes: routes,
      ),
    );
  }
}
