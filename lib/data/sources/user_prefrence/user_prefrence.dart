
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  setLoginKey(bool value) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool('islogin', value);
  }
  Future<bool?> getLoginKey() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    return sp.getBool('islogin');
  }

  Future<bool> saveUser(String email) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("Email",email);
    return true;
  }

  Future<String?>  getUser() async {

    SharedPreferences sp=await SharedPreferences.getInstance();

    final email=sp.getString("Email");

    return email;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}