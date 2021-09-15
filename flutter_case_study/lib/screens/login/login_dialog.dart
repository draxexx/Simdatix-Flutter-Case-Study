import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/login.dart';
import 'package:flutter_case_study/models/user.dart';
import 'package:flutter_case_study/providers/login_providers.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/size_config.dart';
import 'package:flutter_case_study/screens/home/home_screen.dart';
import 'package:flutter_case_study/widgets/ButtonWidget.dart';
import 'package:flutter_case_study/widgets/ContentTextWidget.dart';
import 'package:flutter_case_study/widgets/TextFormFieldWidget.dart';
import 'package:flutter_case_study/widgets/TitleTextWidget.dart';
import 'package:provider/provider.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isValid = true;

  var _isLoading = false;

  LoginModel _loginModel = new LoginModel();

  String message = "";

  void _submit() {
    _formKey.currentState!.save();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _login();
  }

  Future<void> _login() async {
    Provider.of<LoginProviders>(context, listen: false)
        .login(_loginModel)
        .then((value) {
      _isLoading = false;
      if (!value.success!) {
        _isValid = false;
        message = value.message!;
        setState(() {});
      } else {
        UserModel userModel = UserModel.fromJson(value.data);
        HomeScreen.userId = userModel.userId;
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12),
                  TitleTextWidget(
                    text: "Welcome back!",
                    fontSize: getProportionateScreenWidth(23),
                  ),
                  if (!_isValid)
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 12),
                      child: ContentTextWidget(
                        text: message,
                        color: red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (_isValid) SizedBox(height: 24),
                  TextFormFieldWidget(
                    hintText: "Email",
                    onSaved: (v) => _loginModel.email = v as String,
                    errorBorderColor: _isValid ? null : lightRed,
                  ),
                  SizedBox(height: 30),
                  TextFormFieldWidget(
                    hintText: "Password",
                    onSaved: (v) => _loginModel.password = v as String,
                    obsecureText: true,
                    errorBorderColor: _isValid ? null : lightRed,
                  ),
                  SizedBox(height: 24),
                  _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ButtonWidget(
                          bgColor: lightRed,
                          textColor: Colors.white,
                          text: "LOG IN",
                          onTap: _submit,
                        ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
