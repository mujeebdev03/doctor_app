import 'package:shared_preferences/shared_preferences.dart';

/////////////////////////set data
///

class LocalDatabase {
  setAppUserRecord({
    // String? username,
    // String? userIamgeURL,
    // bool? isCustomerlogin,
    // bool? isBusinesslogin,
    String? userid,
    String? useremail,
    bool? islogin,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//  await prefs.setString('userImageURL', userIamgeURL ?? "");
//  await prefs.setString('username', username!);
// await  prefs.setBool('isCustomerlogin', isCustomerlogin!);
//  await prefs.setBool('isBusinesslogin', isBusinesslogin!);

    await prefs.setString("UserId", userid!);
    await prefs.setString('userEmail', useremail!);
    await prefs.setBool('islogin', islogin!);
  }

///////////////////////Get data

  getUserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = prefs.getString('UserId');
    return userID;
  }

  cleardatabase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
