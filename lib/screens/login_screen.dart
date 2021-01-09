import 'package:chat_app/providers/login_provider.dart';
import 'package:chat_app/widgets/android_button.dart';
import 'package:chat_app/widgets/android_text_field.dart';
import 'package:chat_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/login.png"),
            AndroidTextField(
              titleLabel: 'Username',
              icon: Icons.person_pin,
              inputAction: TextInputAction.done,
              inputType: TextInputType.text,
              controller: _userNameController,
              maxLength: 30,
            ),
            AndroidTextField(
              titleLabel: 'password',
              icon: Icons.lock,
              inputAction: TextInputAction.done,
              obsecureText: true,
              maxLines: 1,
              controller: _passwordController,
              inputType: TextInputType.text,
              maxLength: 8,
            ),
            AndroidButton(
              child: authprovider.getIsBusy
                  ? Loading(Theme.of(context).primaryColor)
                  : Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline6,
                    ),
              onPressed: () {
                authprovider
                    .loginPressed(
                      context,
                      _userNameController.text.toString(),
                      _passwordController.text.toString(),
                    )
                    .then((_) {})
                    .catchError((e) => print(e.toString()));
              },
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Don\'t have an account? Signup here',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
