import 'package:flutter/material.dart';

class LoginInfo extends ChangeNotifier {
  /// The username of login.
  String get userName => _userName;
  String _userName = 'login';

  /// Whether a user has logged in.
  bool get loggedIn => _userName.isNotEmpty;

  /// Logs in a user.
  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _userName = '';
    notifyListeners();
  }
}
