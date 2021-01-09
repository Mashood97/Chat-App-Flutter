import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/utils/pref_util.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool _isBusy = false;

  bool get getIsBusy => _isBusy;

  void setBusy(bool val) {
    _isBusy = val;
    notifyListeners();
  }

  Future loginPressed(var context, var login, var password) async {
    setBusy(true);
    await _loginToCC(context, CubeUser(login: login, password: password),
        saveUser: true);
    setBusy(false);
    notifyListeners();
  }

  _loginToCC(var context, CubeUser user, {bool saveUser = false}) {
    createSession(user).then((cubeSession) async {
      var tempUser = user;
      user = cubeSession.user..password = tempUser.password;
      if (saveUser) SharedPrefs.instance.saveNewUser(user);
      _loginToCubeChat(context, user);
    }).catchError((e) => throw e);
  }

  _loginToCubeChat(var context, CubeUser user) {
    print("_loginToCubeChat user $user");
    CubeChatConnection.instance.login(user).then((cubeUser) {
      setBusy(false);
      _naviagateToHome(context, user);
    }).catchError((e) => throw e);
  }

  void autoLogin(var context) async {
    try {
      setBusy(true);
      await SharedPrefs.instance.init();
      CubeUser user = SharedPrefs.instance.getUser();
      if (user != null) {
        createSession(user).then((cubeSession) async {
          var tempUser = user;
          user = cubeSession.user..password = tempUser.password;
          SharedPrefs.instance.saveNewUser(user);
          _naviagateToHome(context, user);
        });
      } else {
        // return false;
      }
      setBusy(false);
    } catch (e) {
      throw e;
    }
  }

  _naviagateToHome(var context, var userArgs) {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeNamed);
  }
}
