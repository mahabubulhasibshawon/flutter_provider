import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  void login(String email, String passwrd) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
      body: {
        'email' : email,
        'passwrd' : passwrd
      }
      );
      if(response.statusCode == 200) {
        print('success');
        setLoading(false);
      }
      else {
        print('failed');
        setLoading(false);
      }
    }catch(e) {
      print(e.toString());
    }
  }
}