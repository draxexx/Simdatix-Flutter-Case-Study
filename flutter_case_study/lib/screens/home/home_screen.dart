import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/screens/login/login_dialog.dart';
import 'package:flutter_case_study/widgets/TitleTextWidget.dart';

import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  static String?
      userId; //uygulama her açıldığında login pop up göstermek için static değişken kullandım
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  void _showLoginDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: LoginDialog(),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      if (HomeScreen.userId == null) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _showLoginDialog();
        });
      }
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightRed,
        leading: Icon(
          Icons.directions_bus,
        ),
        centerTitle: true,
        title: TitleTextWidget(
          text: "TEST APP",
        ),
      ),
      body: HomeBody(),
    );
  }
}
